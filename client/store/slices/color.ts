import { IColor } from './../../types/color';
import { createSlice } from '@reduxjs/toolkit';
import { HYDRATE } from 'next-redux-wrapper';

export interface ColorState {
  colors: IColor[];
}

const initialState: ColorState = {
  colors: [],
};

export const colorSlice = createSlice({
  name: 'color',
  initialState,
  reducers: {
    getColors(state, action) {
      state.colors = action.payload;
    },
  },
  extraReducers: {
    [HYDRATE]: (state, action) => {
      return { ...state, ...action.payload.color };
    },
  },
});

export const colorReducer = colorSlice.reducer;
