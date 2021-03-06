import { AppDispatch } from '..';
import { getAPI } from '../../utils/fetchData';
import { categorySlice } from './../slices/category';

export const getCategoriesByType = (slug: string) => async (dispatch: AppDispatch) => {
  try {
    const response = await getAPI(`category/type/${slug}`);
    dispatch(categorySlice.actions.getCategoriesByType(response.data));
  } catch (error: any) {
    console.log(error);
  }
};

export const getCategoryBySlug = (slug: string) => async (dispatch: AppDispatch) => {
  try {
    const response = await getAPI(`category/slug/${slug}`);
    dispatch(categorySlice.actions.getCategoryBySlug(response.data));
  } catch (error: any) {
    console.log(error);
  }
};
