import { cartReducer } from './slices/cart';
import { configureStore, ThunkAction, Action } from '@reduxjs/toolkit';
import { createWrapper } from 'next-redux-wrapper';
import { departmentReducer } from './slices/department';
import { userReducer } from './slices/user';
import { nextReduxCookieMiddleware } from 'next-redux-cookie-wrapper';

export function makeStore() {
  return configureStore({
    reducer: {
      user: userReducer,
      department: departmentReducer,
      cart: cartReducer,
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
