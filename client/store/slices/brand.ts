import { createSlice } from '@reduxjs/toolkit';
import { HYDRATE } from 'next-redux-wrapper';
import { IBrand } from '../../types/brand';

export interface BrandState {
  brands: IBrand[];
}

const initialState: BrandState = {
  brands: [],
};

export const brandSlice = createSlice({
  name: 'brand',
  initialState,
  reducers: {
    getBrands(state, action) {
      state.brands = action.payload;
    },
  },
  extraReducers: {
    [HYDRATE]: (state, action) => {
      return { ...state, ...action.payload.brand };
    },
  },
});

export const brandReducer = brandSlice.reducer;
