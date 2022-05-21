import { IProduct } from './product';

export interface IOrder {
  id?: number;
  userId: number;
  phone: string;
  comment: string;
  cart: IProduct[];
}
