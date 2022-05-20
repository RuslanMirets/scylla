import { Box, Paper, Typography } from '@mui/material';
import React from 'react';
import styles from './CartForm.module.scss';

export const CartForm: React.FC = () => {
  return <Box className={styles.root}>
    <Typography className={styles.title} variant="h5">Ваши данные</Typography>
    <Paper className={styles.paper}></Paper>
  </Box>;
};
