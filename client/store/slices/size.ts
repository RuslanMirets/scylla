import { ISize } from './../../types/size';
import { createSlice } from '@reduxjs/toolkit';
import { HYDRATE } from 'next-redux-wrapper';

export interface SizeState {
  sizes: ISize[];
}

const initialState: SizeState = {
  sizes: [],
};

export const sizeSlice = createSlice({
  name: 'size',
  initialState,
  reducers: {
    getSizes(state, action) {
      state.sizes = action.payload;
    },
  },
  extraReducers: {
    [HYDRATE]: (state, action) => {
      return { ...state, ...action.payload.size };
    },
  },
});

export const sizeReducer = sizeSlice.reducer;
