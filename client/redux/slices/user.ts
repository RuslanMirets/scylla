import { IUser } from './../../types/user';
import { createSlice, PayloadAction } from '@reduxjs/toolkit';
import { RootState } from '../store';
import { HYDRATE } from 'next-redux-wrapper';

export interface UserState {
  userData: IUser | null;
}

const initialState: UserState = {
  userData: null,
};

export const userSlice = createSlice({
  name: 'user',
  initialState,
  reducers: {
    login: (state, action: PayloadAction<IUser>) => {
      state.userData = action.payload;
    },
    logout(state) {
      state.userData = null;
    },
  },
  extraReducers: {
    [HYDRATE]: (state, action) => {
      return { ...state, ...action.payload.user };
    },
  },
});

export const { login, logout } = userSlice.actions;

export const selectUserData = (state: RootState) => state.user.userData;

export const userReducer = userSlice.reducer;
