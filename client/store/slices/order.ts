import { createSlice } from '@reduxjs/toolkit';
import { IOrder } from '../../types/order';

export interface OrderState {
  orderData: IOrder | null;
}

const initialState: OrderState = {
  orderData: null,
};

export const orderSlice = createSlice({
  name: 'order',
  initialState,
  reducers: {
    createOrder(state, action) {
      state.orderData = action.payload;
    },
  },
});

export const orderReducer = orderSlice.reducer;
