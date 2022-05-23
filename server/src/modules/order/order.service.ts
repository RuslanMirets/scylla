import { OrderProduct } from './../product/models/order-product.model';
import { Inject, Injectable } from '@nestjs/common';
import { ORDER_REPOSITORY } from 'src/core/constants';
import { ProductService } from '../product/product.service';
import { UserService } from '../user/user.service';
import { CreateOrderDto } from './dto/create-order.dto';
import { Order } from './models/order.model';
import { Op } from 'sequelize';

@Injectable()
export class OrderService {
  constructor(
    @Inject(ORDER_REPOSITORY) private readonly orderRepository: typeof Order,
    private readonly userService: UserService,
    private readonly productService: ProductService,
  ) {}

  //@ts-ignore
  async create(dto: CreateOrderDto, userId: number, productId: number): Promise<Order> {
    const user = await this.userService.findOneById(userId);
    const newOrder = await this.orderRepository.create(
      {
        phone: dto.phone,
        comment: dto.comment,
        total: dto.total,
        userId: userId,
        // {include: {model: OrderProduct, where: {quantity: 2}}}
      },
      // { include: [{ model: OrderProduct, where: { quantity: 123 } }] },
      // {
      //   include: {
      //     all: true,
      //     where: { '$orderProduct.quantity$': { [Op.eq]: dto.quantity[0] } },
      //   },
      // },
    );
    const product = await this.productService.findAllById(productId);
    const orderProduct = await newOrder.$set(
      'product',
      product.filter((item) => item.id),
      // { through: { quantity: dto.quantity.map((item) => item) } },
      { through: { model: OrderProduct, where: { quantity: { [Op.eq]: 1123 } } } },
    );

    // const orderProduct2 = await newOrder.$add(
    //   'quantity',
    //  222222,
    //   // { through: { quantity: dto.quantity.map((item) => item) } },
    // );

    // dto.cart.filter((item) => {
    //   return this.productService.sold(item.id, item.quantity, item.inStock, item.sold);
    // });

    return { ...newOrder['dataValues'], orderProduct };
  }

  async findAll() {
    return await this.orderRepository.findAll();
  }
}
