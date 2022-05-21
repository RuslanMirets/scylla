import { CartDataDto } from './cart-data.dto';

export class CreateOrderDto {
  readonly phone: string;
  readonly cart: CartDataDto[];
  readonly total: number;
}
