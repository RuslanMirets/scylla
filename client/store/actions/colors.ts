import { colorSlice } from './../slices/color';
import { AppDispatch } from '..';
import { getAPI } from '../../utils/fetchData';

export const getColors = () => async (dispatch: AppDispatch) => {
  try {
    const response = await getAPI('color');
    dispatch(colorSlice.actions.getColors(response.data));
  } catch (error: any) {
    console.log(error);
  }
};
