import { IProduct } from './../../types/product';
import { createSlice, PayloadAction } from '@reduxjs/toolkit';
import { RootState } from '../store';
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
    addToCart: (state, action) => {
      const itemExists = state.cartData.find((item) => item.id === action.payload.id);
      if (itemExists) {
        itemExists.quantity++;
      } else {
        state.cartData.push({ ...action.payload, quantity: 1 });
      }
    },
    incrementQuantity: (state, action) => {
      const item = state.cartData.find((item) => item.id === action.payload);
      item!.quantity++;
    },
    decrementQuantity: (state, action) => {
      const item = state.cartData.find((item) => item.id === action.payload);
      if (item!.quantity === 1) {
        const index = state.cartData.findIndex((item) => item.id === action.payload);
        state.cartData.splice(index, 1);
      } else {
        item!.quantity--;
      }
    },
    removeFromCart: (state, action) => {
      const index = state.cartData.findIndex((item) => item.id === action.payload);
      state.cartData.splice(index, 1);
    },
  },
  extraReducers: {
    [HYDRATE]: (state, action) => {
      return { ...state, ...action.payload.cart };
    },
  },
});

export const { addToCart, incrementQuantity, decrementQuantity, removeFromCart } =
  cartSlice.actions;

export const selectCartData = (state: RootState) => state.cart.cartData;

export const cartReducer = cartSlice.reducer;
