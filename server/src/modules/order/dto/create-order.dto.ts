export class CreateOrderDto {
  readonly phone: string;
  readonly comment: string;
  readonly total: number;
  readonly quantity: any[];
  readonly products: [
    { id: number; quantity: number; selectedSize: string; inStock: number; sold: number },
  ];
}
