import { yupResolver } from '@hookform/resolvers/yup';
import { Box, Button, Paper, Typography } from '@mui/material';
import React from 'react';
import { FormProvider, useForm } from 'react-hook-form';
import { useAppDispatch } from '../../store/hooks';
import { CartFormSchema } from '../../utils/validations';
import { FormField } from '../FormField';
import styles from './CartForm.module.scss';

interface IProps {
  total: number;
}

export const CartForm: React.FC<IProps> = ({ total }) => {
  const dispatch = useAppDispatch();

  const methods = useForm({
    mode: 'onChange',
    resolver: yupResolver(CartFormSchema),
  });

  const onSubmit = (data: any) => {
    console.log(data);
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
