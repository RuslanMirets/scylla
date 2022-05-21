import { Box, Typography } from '@mui/material';
import { NextPage } from 'next';
import React from 'react';
import { CartForm } from '../components/CartForm';
import { CartOrder } from '../components/CartOrder';
import MainLayout from '../layouts/MainLayout';
import { useAppSelector } from '../store/hooks';

const Cart: NextPage = () => {
  const { cartData } = useAppSelector((state) => state.cart);

  const [total, setTotal] = React.useState(0);
  React.useEffect(() => {
    const getTotal = () => {
      const res = cartData.reduce((prev, item) => {
        return prev + item.price * item.quantity;
      }, 0);
      setTotal(res);
    };
    getTotal();
  }, [cartData]);

  // if (cartData.length === 0) {
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
        <CartOrder cartData={cartData} total={total} />
        <CartForm total={total} />
      </Box>
    </MainLayout>
  );
};

export default Cart;
