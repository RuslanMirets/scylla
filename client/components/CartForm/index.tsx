import { yupResolver } from '@hookform/resolvers/yup';
import { Box, Button, Paper, Typography } from '@mui/material';
import React from 'react';
import { FormProvider, useForm } from 'react-hook-form';
import { useAppDispatch, useAppSelector } from '../../redux/hooks';
import { clearCart, selectCartData } from '../../redux/slices/cart';
import { createOrder } from '../../redux/slices/order';
import { selectUserData } from '../../redux/slices/user';
import { Api } from '../../utils/api';
import { CartFormSchema } from '../../utils/validations';
import { FormField } from '../FormField';
import styles from './CartForm.module.scss';

interface IProps {
  total: number;
  callback: any;
  setCallback: any;
}

export const CartForm: React.FC<IProps> = ({ total, callback, setCallback }) => {
  const dispatch = useAppDispatch();
  const user = useAppSelector(selectUserData);
  const cartData = useAppSelector(selectCartData);

  const methods = useForm({
    mode: 'onChange',
    resolver: yupResolver(CartFormSchema),
  });

  const onSubmit = async (orderData: any) => {
    try {
      let newCart = [];
      for (const item of cartData) {
        const response = await Api().product.getOneById(item.id);
        const { inStock } = response;
        if (inStock - item.quantity >= 0) {
          newCart.push(item);
        }
      }
      if (newCart.length < cartData.length) {
        setCallback(!callback);
        console.log('Товара нет на складе или его недостаточное количество');
      }
      const newOrder = {
        userId: user?.id,
        phone: orderData.phone,
        cart: cartData,
        total,
      };
      const response = await Api().order.create(newOrder);
      dispatch(createOrder(response));
      dispatch(clearCart());
      methods.reset();
    } catch (error) {
      console.log(error);
    }
  };

  return (
    <Box className={styles.root}>
      <Typography className={styles.title} variant="h5">
        Ваши данные
      </Typography>
      <Paper className={styles.paper}>
        <FormProvider {...methods}>
          <form onSubmit={methods.handleSubmit(onSubmit)}>
            <FormField type="tel" label="Телефон" name="phone" />
            <FormField type="text" label="Комментарий" name="comment" maxRows={6} multiline />
            <Button
              disabled={!methods.formState.isValid || methods.formState.isSubmitting}
              type="submit"
              color="primary"
              variant="contained">
              Купить
            </Button>
          </form>
        </FormProvider>
      </Paper>
    </Box>
  );
};
