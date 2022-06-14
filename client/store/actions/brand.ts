import { AppDispatch } from '..';
import { getAPI } from '../../utils/fetchData';
import { brandSlice } from './../slices/brand';

export const getBrands = () => async (dispatch: AppDispatch) => {
  try {
    const response = await getAPI('brand');
    dispatch(brandSlice.actions.getBrands(response.data));
  } catch (error: any) {
    console.log(error);
  }
};
