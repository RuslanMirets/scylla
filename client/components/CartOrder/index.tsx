import { Box, Button, Paper, Typography } from '@mui/material';
import React from 'react';
import { IProduct } from '../../types/product';
import { CartItem } from '../CartItem';
import styles from './CartOrder.module.scss';

interface IProps {
  cart: IProduct[];
}

export const CartOrder: React.FC<IProps> = ({ cart }) => {
  const [total, setTotal] = React.useState(0);

  React.useEffect(() => {
    const getTotal = () => {
      const res = cart.reduce((prev, item) => {
        return prev + item.price * item.quantity;
      }, 0);
      setTotal(res);
    };
    getTotal();
  }, [cart]);

  return (
    <Box className={styles.root}>
      <Typography className={styles.title} variant="h5">
        Оформление заказа
      </Typography>
      <Paper className={styles.paper}>
        <Box className={styles.items}>
          {cart.map((item) => (
            <CartItem key={item.id} item={item} />
          ))}
        </Box>
        <Box className={styles.foot}>
          <Button color="error">Очистить корзину</Button>
          <Typography className={styles.total} variant="h6">
            Всего: {total} ₽
          </Typography>
        </Box>
      </Paper>
    </Box>
  );
};
