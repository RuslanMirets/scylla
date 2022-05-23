export class CreateOrderDto {
  readonly phone: string;
  readonly comment: string;
  readonly total: number;
  readonly quantity: any[];
}
