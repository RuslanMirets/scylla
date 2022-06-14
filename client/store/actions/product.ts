import { IProduct } from './../../types/product';
import { AppDispatch } from '..';
import { getAPI, postAPI } from '../../utils/fetchData';
import { productSlice } from './../slices/product';
import { alertSlice } from '../slices/alert';

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

// export const createHotel = (data: IHotel) => async (dispatch: AppDispatch) => {
//   try {
//     const formData = new FormData();
//     formData.append('name', data.name);
//     formData.append('location', data.location);
//     formData.append('complexId', data.complexId as any);
//     formData.append('image', data.image[0]);

//     const response = await postAPI('hotel', formData);
//     dispatch(hotelSlice.actions.createHotel(response.data));
//     dispatch(alertSlice.actions.success('Отель добавлен'));

//     const getResponse = await getAPI('hotel');
//     dispatch(hotelSlice.actions.getHotels(getResponse.data));
//   } catch (error: any) {
//     dispatch(alertSlice.actions.errors(error.response.data.message));
//   }
// };

export const createProduct = (data: IProduct) => async (dispatch: AppDispatch) => {
  try {
    const price = data.price.toString()
    const formData = new FormData();
    formData.append('title', data.title);
    formData.append('price', price);
    formData.append('description', data.description);
    // formData.append('inStock', data.inStock);
    // formData.append('images', data.images);
    formData.append('categoryId', data.categoryId as any);
    formData.append('brandId', data.brandId as any);
    formData.append('size', data.size as any);
    formData.append('color', data.color as any);

    const response = await postAPI('product', formData);
    dispatch(productSlice.actions.createProduct(response.data));
    dispatch(alertSlice.actions.success('Товар добавлен'));
  } catch (error: any) {
    dispatch(alertSlice.actions.errors(error.response.data.message));
  }
};
