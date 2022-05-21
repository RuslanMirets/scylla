import { OrderApi } from './order.api';
import { ProductApi } from './product.api';
import { CategoryApi } from './category.api';
import { TypeApi } from './type.api';
import { DepartmentApi } from './department.api';
import Cookies, { parseCookies } from 'nookies';
import axios from 'axios';
import { GetServerSidePropsContext, NextPageContext } from 'next';
import { UserApi } from './user.api';

export type ApiReturnType = {
  user: ReturnType<typeof UserApi>;
  department: ReturnType<typeof DepartmentApi>;
  type: ReturnType<typeof TypeApi>;
  category: ReturnType<typeof CategoryApi>;
  product: ReturnType<typeof ProductApi>;
  order: ReturnType<typeof OrderApi>;
};

export const Api = (ctx?: NextPageContext | GetServerSidePropsContext): ApiReturnType => {
  const cookies = ctx ? Cookies.get(ctx) : parseCookies();
  const token = cookies.scyllaToken;

  const instance = axios.create({
    baseURL: 'http://localhost:5000',
    headers: {
      Authorization: 'Bearer ' + token,
    },
  });

  const apis = {
    user: UserApi,
    department: DepartmentApi,
    type: TypeApi,
    category: CategoryApi,
    product: ProductApi,
    order: OrderApi,
  };

  const result = Object.entries(apis).reduce((prev, [key, f]) => {
    return {
      ...prev,
      [key]: f(instance),
    };
  }, {} as ApiReturnType);

  return result;
};
