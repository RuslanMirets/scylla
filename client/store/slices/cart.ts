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
    clearCart: () => {
      return initialState;
    },
  },
  extraReducers: {
    [HYDRATE]: (state, action) => {
      return { ...state, ...action.payload.cart };
    },
  },
});

export const { incrementQuantity, decrementQuantity, removeFromCart, clearCart } =
  cartSlice.actions;

export const cartReducer = cartSlice.reducer;
