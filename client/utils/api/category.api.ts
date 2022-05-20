import { ICategory } from './../../types/category';
import { AxiosInstance } from 'axios';

export const CategoryApi = (instance: AxiosInstance) => ({
  async getAllByType(slug: string) {
    const { data } = await instance.get<ICategory[]>(`/category/type/${slug}`);
    return data;
  },
  async getOneBySlug(slug: string) {
    const { data } = await instance.get<ICategory>(`/category/slug/${slug}`);
    return data;
  },
});
