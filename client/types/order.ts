import { IProduct } from './product';

export interface IOrder {
  id?: number;
  phone: string;
  cart: IProduct[];
}
