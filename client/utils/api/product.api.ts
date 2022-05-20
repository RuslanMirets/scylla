import { IProduct } from './../../types/product';
import { AxiosInstance } from 'axios';

export const ProductApi = (instance: AxiosInstance) => ({
  async getAllByCategory(slug: string) {
    const { data } = await instance.get<IProduct[]>(`/product/category/${slug}`);
    return data;
  },
});
