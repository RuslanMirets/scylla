import { IDepartment } from './../../types/department';
import { AxiosInstance } from 'axios';

export const DepartmentApi = (instance: AxiosInstance) => ({
  async getAll() {
    const { data } = await instance.get<IDepartment[]>('/department');
    return data;
  },
  async getBySlug(slug: string) {
    const { data } = await instance.get<IDepartment>('/department/slug/', { params: { slug } });
    return data;
  },
});
