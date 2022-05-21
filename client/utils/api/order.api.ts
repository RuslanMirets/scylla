import { IOrder } from './../../types/order';
import { AxiosInstance } from 'axios';

export const OrderApi = (instance: AxiosInstance) => ({
  // async getAll() {
  //   const { data } = await instance.get<IUser[]>('/user');
  //   return data;
  // },
  // async register(dto: IUserRegister) {
  //   const { data } = await instance.post<IUserRegister, { data: IUser }>('/auth/register', dto);
  //   return data;
  // },
  // async login(dto: IUserLogin) {
  //   const { data } = await instance.post<IUserLogin, { data: IUser }>('/auth/login', dto);
  //   return data;
  // },
  // async getMe() {
  //   const { data } = await instance.get<IUser>('/user/profile');
  //   return data;
  // },
  async create(dto: IOrder) {
    const { data } = await instance.post<IOrder, { data: IOrder }>('/order', dto);
    return data;
  },
});
