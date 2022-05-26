import { OrderProduct } from './../../product/models/order-product.model';
import { Product } from './../../product/models/product.model';
import {
  Table,
  Model,
  Column,
  DataType,
  BelongsTo,
  ForeignKey,
  BelongsToMany,
} from 'sequelize-typescript';
import { User } from 'src/modules/user/models/user.model';

@Table({ tableName: 'Order' })
export class Order extends Model<Order> {
  @Column({ type: DataType.INTEGER, unique: true, autoIncrement: true, primaryKey: true })
  id: number;

  @Column({ type: DataType.STRING, allowNull: false })
  phone: string;

  @Column({ type: DataType.STRING, allowNull: false })
  comment: string;

  @Column({ type: DataType.FLOAT, allowNull: false })
  total: number;

  @ForeignKey(() => User)
  @Column({ type: DataType.INTEGER, allowNull: false })
  userId: number;

  @BelongsTo(() => User)
  user: User;

  @BelongsToMany(() => Product, () => OrderProduct)
  product: Product[];
}
