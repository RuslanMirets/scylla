import { IProduct } from './../../types/product';
import { createSlice, PayloadAction } from '@reduxjs/toolkit';
import { HYDRATE } from 'next-redux-wrapper';

export interface ProductState {
  products: IProduct[];
  product: IProduct | null;
}

const initialState: ProductState = {
  products: [],
  product: null,
};

export const productSlice = createSlice({
  name: 'product',
  initialState,
  reducers: {
    getProductsByCategory(state, action) {
      state.products = action.payload;
    },
    getProductById(state, action) {
      state.product = action.payload;
    },
    createProduct(state, action: PayloadAction<IProduct>) {
      state.product = action.payload;
    },
    getSimilarProducts(state, action: PayloadAction<IProduct[]>) {
      state.products = action.payload;
    },
  },
  extraReducers: {
    [HYDRATE]: (state, action) => {
      return { ...state, ...action.payload.product };
    },
  },
});

export const productReducer = productSlice.reducer;
