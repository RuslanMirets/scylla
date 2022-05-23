import { Body, Controller, Get, Post, UseGuards } from '@nestjs/common';
import { Product } from 'src/core/decorators/product.decorator';
import { User } from 'src/core/decorators/user.decorator';
import { JwtAuthGuard } from 'src/core/guards/jwt-auth.guard';
import { CreateOrderDto } from './dto/create-order.dto';
import { OrderService } from './order.service';

@Controller('order')
export class OrderController {
  constructor(private readonly orderService: OrderService) {}

  @UseGuards(JwtAuthGuard)
  @Post()
  create(@Body() dto: CreateOrderDto, @User() userId: number, @Product() productId: number) {
    return this.orderService.create(dto, userId, productId);
  }

  @UseGuards(JwtAuthGuard)
  @Get()
  findAll() {
    return this.orderService.findAll();
  }
}
