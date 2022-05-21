import { IProduct } from './../../types/product';
import { AxiosInstance } from 'axios';

export const ProductApi = (instance: AxiosInstance) => ({
  async getAllByCategory(slug: string) {
    const { data } = await instance.get<IProduct[]>(`/product/category/${slug}`);
    return data;
  },
  async getOneById(id: any) {
    const { data } = await instance.get<IProduct>(`/product/${id}`);
    return data;
  },
});
