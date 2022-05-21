import { parseCookies } from 'nookies';
import { AppDispatch } from '..';
import { IOrder } from '../../types/order';
import { postAPI } from '../../utils/fetchData';
import { alertSlice } from '../slices/alert';
import { orderSlice } from '../slices/order';

export const createOrder = (dto: IOrder) => async (dispatch: AppDispatch) => {
  try {
    const { scyllaToken } = parseCookies();
    const response = await postAPI('order', dto, scyllaToken);
    dispatch(orderSlice.actions.createOrder(response.data));
    dispatch(alertSlice.actions.success('Заказ успешно создан'));
  } catch (error: any) {
    dispatch(alertSlice.actions.errors(error.response.data.message));
  }
};
