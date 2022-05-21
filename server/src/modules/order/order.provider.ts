import { ORDER_REPOSITORY } from './../../core/constants/index';
import { Order } from './models/order.model';

export const orderProvider = [{ provide: ORDER_REPOSITORY, useValue: Order }];
