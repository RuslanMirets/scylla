import { Box, Typography } from '@mui/material';
import { NextPage } from 'next';
import React from 'react';
import { CartForm } from '../components/CartForm';
import { CartOrder } from '../components/CartOrder';
import MainLayout from '../layouts/MainLayout';
import { useAppSelector } from '../redux/hooks';
import { selectCartData } from '../redux/slices/cart';

const Cart: NextPage = () => {
  const cart = useAppSelector(selectCartData);

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
        <CartOrder cart={cart} />
        <CartForm />
      </Box>
    </MainLayout>
  );
};

export default Cart;
