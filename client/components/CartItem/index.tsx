import { Box, Button, Divider, Typography } from '@mui/material';
import AddIcon from '@mui/icons-material/Add';
import RemoveIcon from '@mui/icons-material/Remove';
import ClearIcon from '@mui/icons-material/Clear';
import React from 'react';
import { IProduct } from '../../types/product';
import { productImage } from '../../utils/constants';
import styles from './CartItem.module.scss';
import { LinkItem } from '../LinkItem';
import { useAppDispatch } from '../../store/hooks';
import { decrementQuantity, incrementQuantity, removeFromCart } from '../../store/slices/cart';

interface IProps {
  item: IProduct;
}

export const CartItem: React.FC<IProps> = ({ item }) => {
  const dispatch = useAppDispatch();

  const handleDecrease = () => {
    dispatch(decrementQuantity(item.id));
  };

  const handleIncrease = () => {
    dispatch(incrementQuantity(item.id));
  };

  const handleRemove = () => {
    dispatch(removeFromCart(item.id));
  };

  return (
    <>
      <Box className={styles.root}>
        <LinkItem href={`/product/${item.id}`}>
          <img src={productImage + item.images[0]} alt={item.title} />
        </LinkItem>
        <Typography className={styles.title}>
          <LinkItem href={`/product/${item.id}`}>{item.title}</LinkItem>
        </Typography>
        <Box className={styles.count}>
          <Button
            variant="outlined"
            onClick={handleDecrease}
            disabled={item.quantity === 1 ? true : false}>
            <RemoveIcon />
          </Button>
          <span>{item.quantity}</span>
          <Button
            variant="outlined"
            onClick={handleIncrease}
            disabled={item.quantity === item.inStock ? true : false}>
            <AddIcon />
          </Button>
        </Box>
        <Typography className={styles.price} variant="h6">
          {item.price * item.quantity} ₽
        </Typography>
        <Button className={styles.remove} color="error" onClick={handleRemove}>
          <ClearIcon />
        </Button>
      </Box>
      <Divider />
    </>
  );
};
