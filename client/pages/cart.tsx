import { Box, Typography } from '@mui/material';
import { NextPage } from 'next';
import React from 'react';
import { CartForm } from '../components/CartForm';
import { CartOrder } from '../components/CartOrder';
import MainLayout from '../layouts/MainLayout';
import { useAppDispatch, useAppSelector } from '../redux/hooks';
import { cartSlice, selectCartData } from '../redux/slices/cart';
import { Api } from '../utils/api';

const Cart: NextPage = () => {
  const dispatch = useAppDispatch();
  const cart = useAppSelector(selectCartData);

  const [total, setTotal] = React.useState(0);

  const [callback, setCallback] = React.useState(false);

  React.useEffect(() => {
    const getTotal = () => {
      const res = cart.reduce((prev, item) => {
        return prev + item.price * item.quantity;
      }, 0);
      setTotal(res);
    };
    getTotal();
  }, [cart]);

  React.useEffect(() => {
    if (cart && cart.length > 0) {
      let newArr: any[] = [];
      const updateCart = async () => {
        for (const item of cart) {
          const response = await Api().product.getOneById(item.id);
          const { id, title, images, price, inStock, sold } = response;
          if (inStock > 0) {
            newArr.push({
              id,
              title,
              images,
              price,
              inStock,
              sold,
              quantity: item.quantity > inStock ? 1 : item.quantity,
            });
          }
        }
        dispatch(cartSlice.actions.addToCart(newArr[0]));
      };
      updateCart();
    }
  }, [callback]);

  // if (cart.length === 0) {
  //   return (
  //     <MainLayout title="Корзина">
  //       <Box className="empty-cart">
  //         <img src="/assets/images/empty-cart.png" alt="Пустая корзина" />
  //         <Typography variant="h6">Корзина пуста</Typography>
  //       </Box>
  //     </MainLayout>
  //   );
  // }

  return (
    <MainLayout title="Корзина">
      <Box className="cart">
        <CartOrder cart={cart} total={total} />
        <CartForm total={total} callback={callback} setCallback={setCallback} />
      </Box>
    </MainLayout>
  );
};

export default Cart;
