import { yupResolver } from '@hookform/resolvers/yup';
import { Box, Button, Paper, Typography } from '@mui/material';
import React from 'react';
import { FormProvider, useForm } from 'react-hook-form';
import { createOrder } from '../../store/actions/order';
import { useAppDispatch, useAppSelector } from '../../store/hooks';
import { alertSlice } from '../../store/slices/alert';
import { clearCart } from '../../store/slices/cart';
import { CartFormSchema } from '../../utils/validations';
import { FormField } from '../FormField';
import styles from './CartForm.module.scss';

interface IProps {
  total: number;
}

export const CartForm: React.FC<IProps> = ({ total }) => {
  const dispatch = useAppDispatch();
  const { user } = useAppSelector((state) => state.user);
  const { cartData } = useAppSelector((state) => state.cart);

  const methods = useForm({
    mode: 'onChange',
    resolver: yupResolver(CartFormSchema),
  });

  const onSubmit = (data: any) => {
    const orderData = {
      userId: user!.id,
      address: data.address,
      phone: data.phone,
      comment: data.comment,
      cart: cartData,
      total,
    };
    dispatch(createOrder(orderData));
    dispatch(clearCart());
    methods.reset();
  };

  const handleNoAccess = () => {
    dispatch(alertSlice.actions.errors('Войдите в аккаунт или зарегистрируйтесь'));
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
            {user ? (
              <Button
                disabled={!methods.formState.isValid || methods.formState.isSubmitting}
                type="submit"
                color="primary"
                variant="contained">
                Купить
              </Button>
            ) : (
              <Button
                disabled={!methods.formState.isValid || methods.formState.isSubmitting}
                color="primary"
                variant="contained"
                onClick={handleNoAccess}>
                Купить
              </Button>
            )}
          </form>
        </FormProvider>
      </Paper>
    </Box>
  );
};
