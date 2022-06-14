import { sizeSlice } from './../slices/size';
import { AppDispatch } from '..';
import { getAPI } from '../../utils/fetchData';

export const getSizes = () => async (dispatch: AppDispatch) => {
  try {
    const response = await getAPI('size');
    dispatch(sizeSlice.actions.getSizes(response.data));
  } catch (error: any) {
    console.log(error);
  }
};
