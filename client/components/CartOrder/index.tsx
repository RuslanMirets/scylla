import { Box, Paper, Typography } from '@mui/material';
import React from 'react';
import { IProduct } from '../../types/product';
import { CartItem } from '../CartItem';
import styles from './CartOrder.module.scss';

interface IProps {
  cart: IProduct[];
}

export const CartOrder: React.FC<IProps> = ({ cart }) => {
  return (
    <Box className={styles.root}>
      <Typography className={styles.title} variant="h5">Оформление заказа</Typography>
      <Paper className={styles.paper}>
        {cart.map((item) => (
          <CartItem key={item.id} item={item} />
        ))}
      </Paper>
    </Box>
  );
};
