import { sizeReducer } from './slices/size';
import { colorReducer } from './slices/color';
import { brandReducer } from './slices/brand';
import { cartReducer } from './slices/cart';
import { productReducer } from './slices/product';
import { categoryReducer } from './slices/category';
import { departmentReducer } from './slices/department';
import { alertReducer } from './slices/alert';
import { userReducer } from './slices/user';
import { configureStore, ThunkAction, Action } from '@reduxjs/toolkit';
import { createWrapper } from 'next-redux-wrapper';
import { typeReducer } from './slices/type';
import { nextReduxCookieMiddleware } from 'next-redux-cookie-wrapper';

export function makeStore() {
  return configureStore({
    reducer: {
      user: userReducer,
      alert: alertReducer,
      department: departmentReducer,
      type: typeReducer,
      category: categoryReducer,
      product: productReducer,
      cart: cartReducer,
      brand: brandReducer,
      color: colorReducer,
      size: sizeReducer,
    },
    middleware: (getDefaultMiddleware) =>
      getDefaultMiddleware().prepend(
        nextReduxCookieMiddleware({
          subtrees: [{ subtree: 'cart', cookieName: 'scyllaCart' }],
          secure: true,
          sameSite: 'none',
        }),
      ),
  });
}

export const store = makeStore();

export type RootStore = ReturnType<typeof makeStore>;
export type RootState = ReturnType<RootStore['getState']>;
export type AppDispatch = typeof store.dispatch;

export type AppThunk<ReturnType = void> = ThunkAction<
  ReturnType,
  RootState,
  unknown,
  Action<string>
>;

export const wrapper = createWrapper<RootStore>(makeStore);
