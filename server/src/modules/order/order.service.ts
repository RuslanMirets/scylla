import { Inject, Injectable } from '@nestjs/common';
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
    const newOrder = await this.orderRepository.create({
      phone: dto.phone,
      cart: dto.cart,
      total: dto.total,
      userId: userId,
    });
    dto.cart.filter((item) => {
      return this.productService.sold(item.id, item.quantity, item.inStock, item.sold);
    });
    return { ...newOrder['dataValues'], user };
  }

  async findAll() {
    return await this.orderRepository.findAll();
  }
}
