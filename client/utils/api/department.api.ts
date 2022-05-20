import { IDepartment } from '../../types/department';
import { AxiosInstance } from 'axios';

export const DepartmentApi = (instance: AxiosInstance) => ({
  async getAll() {
    const { data } = await instance.get<IDepartment[]>('/department');
    return data;
  },
  async getOneBySlug(slug: string) {
    const { data } = await instance.get<IDepartment>(`/department/slug/${slug}`);
    return data;
  },
  async getOneByType(slug: string) {
    const { data } = await instance.get<IDepartment>(`/department/type/${slug}`);
    return data;
  },
});
