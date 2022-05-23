import { Product } from 'src/modules/product/models/product.model';
import { Order } from 'src/modules/order/models/order.model';
import { Table, Model, Column, DataType, ForeignKey } from 'sequelize-typescript';

@Table({ tableName: 'OrderProduct', createdAt: false, updatedAt: false })
export class OrderProduct extends Model<OrderProduct> {
  @Column({ type: DataType.INTEGER, unique: true, autoIncrement: true, primaryKey: true })
  id: number;

  @ForeignKey(() => Order)
  @Column({ type: DataType.INTEGER })
  orderId: number;

  @ForeignKey(() => Product)
  @Column({ type: DataType.INTEGER })
  productId: number;

  @Column({ type: DataType.JSONB, allowNull: true })
  quantity: any | any[];
}
