import { OrderProduct } from './../product/models/order-product.model';
import { BadRequestException, Inject, Injectable } from '@nestjs/common';
import { ORDER_REPOSITORY } from 'src/core/constants';
import { ProductService } from '../product/product.service';
import { UserService } from '../user/user.service';
import { CreateOrderDto } from './dto/create-order.dto';
import { Order } from './models/order.model';

@Injectable()
export class OrderService {
  constructor(
    @Inject(ORDER_REPOSITORY) private readonly orderRepository: typeof Order,
    private readonly userService: UserService,
    private readonly productService: ProductService,
  ) {}

  async create(dto: CreateOrderDto, userId: number): Promise<Order> {
    const user = await this.userService.findOneById(userId);

    const savedOrder = await this.orderRepository.create({
      phone: dto.phone,
      comment: dto.comment,
      total: dto.total,
      userId: userId,
    });

    dto.products.forEach((item) => {
      const product = this.productService.findOneById(item.id);
      if (!product) {
        throw new BadRequestException('Нет такого продукта');
      }
      const orderProduct = {
        orderId: savedOrder.id,
        productId: item.id,
        quantity: item.quantity,
        selectedSize: item.selectedSize,
      };
      const savedOrderProduct = OrderProduct.create(orderProduct);
      this.productService.sold(item.id, item.quantity, item.inStock, item.sold);
    });

    return { ...savedOrder['dataValues'] };
  }

  async findAll() {
    return await this.orderRepository.findAll();
  }
}
