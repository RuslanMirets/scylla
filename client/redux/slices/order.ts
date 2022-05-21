import { IOrder } from './../../types/order';
import { createSlice, PayloadAction } from '@reduxjs/toolkit';
import { RootState } from '../store';
import { HYDRATE } from 'next-redux-wrapper';

export interface OrderState {
  orderData: IOrder[];
}

const initialState: OrderState = {
  orderData: [],
};

export const orderSlice = createSlice({
  name: 'order',
  initialState,
  reducers: {
    createOrder: (state, action) => {
      state.orderData = action.payload;
    },
  },
  extraReducers: {
    [HYDRATE]: (state, action) => {
      return { ...state, ...action.payload.order };
    },
  },
});

export const { createOrder } = orderSlice.actions;

// export const selectDepartmentsData = (state: RootState) => state.department.departments;

export const orderReducer = orderSlice.reducer;
