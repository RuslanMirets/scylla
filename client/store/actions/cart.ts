import { alertSlice } from './../slices/alert';
import { AppDispatch } from '..';
import { cartSlice } from './../slices/cart';
import { IProduct } from '../../types/product';

export const addToCart = (product: IProduct, cart: IProduct[]) => async (dispatch: AppDispatch) => {
  try {
    const itemExists = cart.every((item: any) => {
      return item.id !== product.id;
    });
    if (itemExists) {
      dispatch(cartSlice.actions.addToCart([...cart, { ...product, quantity: 1 }]));
      dispatch(alertSlice.actions.success('Товар добавлен в корзину'));
    }
  } catch (error: any) {
    dispatch(alertSlice.actions.errors(error));
  }
};
