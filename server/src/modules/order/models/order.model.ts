import { CartDataDto } from './../dto/cart-data.dto';
import { Table, Model, Column, DataType, BelongsTo, ForeignKey } from 'sequelize-typescript';
import { User } from 'src/modules/user/models/user.model';

@Table({ tableName: 'Order' })
export class Order extends Model<Order> {
  @Column({ type: DataType.INTEGER, unique: true, autoIncrement: true, primaryKey: true })
  id: number;

  @Column({ type: DataType.STRING, allowNull: false })
  phone: string;

  @Column({ type: DataType.JSONB, allowNull: false })
  cart: CartDataDto[];

  @Column({ type: DataType.FLOAT, allowNull: false })
  total: number;

  @ForeignKey(() => User)
  @Column({ type: DataType.INTEGER, allowNull: false })
  userId: number;

  @BelongsTo(() => User, { onDelete: 'CASCADE' })
  user: User;
}
