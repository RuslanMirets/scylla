import { IDepartment } from './../../types/department';
import { createSlice, PayloadAction } from '@reduxjs/toolkit';
import { RootState } from '../store';
import { HYDRATE } from 'next-redux-wrapper';

export interface DepartmentState {
  departments: IDepartment[];
}

const initialState: DepartmentState = {
  departments: [],
};

export const departmentSlice = createSlice({
  name: 'department',
  initialState,
  reducers: {
    setDepartment: (state, action: PayloadAction<IDepartment[]>) => {
      state.departments = action.payload;
    },
  },
  extraReducers: {
    [HYDRATE]: (state, action) => {
      return { ...state, ...action.payload.department };
    },
  },
});

export const { setDepartment } = departmentSlice.actions;

export const selectDepartmentsData = (state: RootState) => state.department.departments;

export const departmentReducer = departmentSlice.reducer;
