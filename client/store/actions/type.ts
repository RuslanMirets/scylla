import { AppDispatch } from '..';
import { getAPI } from '../../utils/fetchData';
import { typeSlice } from '../slices/type';

export const getTypes = () => async (dispatch: AppDispatch) => {
  try {
    const response = await getAPI('type');
    dispatch(typeSlice.actions.getTypes(response.data));
  } catch (error: any) {
    console.log(error);
  }
};

export const getTypesByDepartment = (slug: string) => async (dispatch: AppDispatch) => {
  try {
    const response = await getAPI(`type/department/${slug}`);
    dispatch(typeSlice.actions.getTypesByDepartment(response.data));
  } catch (error: any) {
    console.log(error);
  }
};

export const getTypeBySlug = (slug: string) => async (dispatch: AppDispatch) => {
  try {
    const response = await getAPI(`type/slug/${slug}`);
    dispatch(typeSlice.actions.getTypeBySlug(response.data));
  } catch (error: any) {
    console.log(error);
  }
};
