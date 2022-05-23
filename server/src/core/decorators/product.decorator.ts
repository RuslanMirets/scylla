import { createParamDecorator, ExecutionContext } from '@nestjs/common';
import { Product as ProductModel } from 'src/modules/product/models/product.model';

export const Product = createParamDecorator((_: unknown, ctx: ExecutionContext): ProductModel => {
  const request = ctx.switchToHttp().getRequest();
  return request.body.productId;
});
