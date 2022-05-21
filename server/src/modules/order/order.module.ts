import { Module } from '@nestjs/common';
import { OrderService } from './order.service';
import { OrderController } from './order.controller';
import { orderProvider } from './order.provider';
import { ProductModule } from '../product/product.module';
import { UserModule } from '../user/user.module';

@Module({
  imports: [UserModule, ProductModule],
  providers: [OrderService, ...orderProvider],
  controllers: [OrderController],
})
export class OrderModule {}
