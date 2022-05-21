import { IProduct } from './../../types/product';
import { createSlice } from '@reduxjs/toolkit';
import { HYDRATE } from 'next-redux-wrapper';

export interface CartState {
  cartData: IProduct[];
}

const initialState: CartState = {
  cartData: [],
};

export const cartSlice = createSlice({
  name: 'cart',
  initialState,
  reducers: {
    addToCart(state, action) {
      state.cartData = action.payload;
    },
  },
  extraReducers: {
    [HYDRATE]: (state, action) => {
      return { ...state, ...action.payload.cart };
    },
  },
});

export const cartReducer = cartSlice.reducer;
