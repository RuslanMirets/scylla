import { AppDispatch } from '..';
import { getAPI } from '../../utils/fetchData';
import { productSlice } from './../slices/product';

export const getProductsByCategory = (slug: string) => async (dispatch: AppDispatch) => {
  try {
    const response = await getAPI(`product/category/${slug}`);
    dispatch(productSlice.actions.getProductsByCategory(response.data));
  } catch (error: any) {
    console.log(error);
  }
};

export const getProductById = (id: string) => async (dispatch: AppDispatch) => {
  try {
    const response = await getAPI(`product/${id}`);
    dispatch(productSlice.actions.getProductById(response.data));
  } catch (error: any) {
    console.log(error);
  }
};
