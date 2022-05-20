import { IType } from './../../types/type';
import { AxiosInstance } from 'axios';

export const TypeApi = (instance: AxiosInstance) => ({
  async getAllByType(slug: string) {
    const { data } = await instance.get<IType[]>(`/type/department/${slug}`);
    return data;
  },
  async getOneBySlug(slug: string) {
    const { data } = await instance.get<IType>(`/type/slug/${slug}`);
    return data;
  },
});
