import { AppDispatch } from '..';
import { getAPI } from '../../utils/fetchData';
import { departmentSlice } from './../slices/department';

export const getDepartments = () => async (dispatch: AppDispatch) => {
  try {
    const response = await getAPI('department');
    dispatch(departmentSlice.actions.getDepartments(response.data));
  } catch (error: any) {
    console.log(error);
  }
};

export const getDepartmentBySlug = (slug: string) => async (dispatch: AppDispatch) => {
  try {
    const response = await getAPI(`department/slug/${slug}`);
    dispatch(departmentSlice.actions.getDepartmentBySlug(response.data));
  } catch (error: any) {
    console.log(error);
  }
};

export const getDepartmentByType = (slug: string) => async (dispatch: AppDispatch) => {
  try {
    const response = await getAPI(`department/type/${slug}`);
    dispatch(departmentSlice.actions.getDepartmentByType(response.data));
  } catch (error: any) {
    console.log(error);
  }
};
