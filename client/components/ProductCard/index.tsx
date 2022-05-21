import { Card, CardMedia, CardContent, Typography, CardActions, Button } from '@mui/material';
import React from 'react';
import { useAppSelector } from '../../redux/hooks';
import { selectCartData } from '../../redux/slices/cart';
import { IProduct } from '../../types/product';
import { productImage } from '../../utils/constants';
import { LinkItem } from '../LinkItem';
import { SizeDialog } from '../SizeDialog';
import styles from './ProductCard.module.scss';

interface IProps {
  product: IProduct;
}

export const ProductCard: React.FC<IProps> = ({ product }) => {
  const cart = useAppSelector(selectCartData);

  const itemExists = cart.find((item) => item.id === product.id);

  const [open, setOpen] = React.useState(false);
  const toggleSizeDialog = () => {
    setOpen(!open);
  };
  const openSizeDialog = () => {
    toggleSizeDialog();
  };

  return (
    <>
      <Card className={styles.root}>
        <LinkItem href={`/product/${product.id}`}>
          <CardMedia component="img" image={productImage + product.images[0]} alt={product.title} />
        </LinkItem>
        <CardContent className={styles.content}>
          <LinkItem href={`/product/${product.id}`}>
            <Typography className={styles.title} variant="h6">
              {product.title}
            </Typography>
          </LinkItem>
        </CardContent>
        <CardActions className={styles.actions}>
          <Typography className={styles.price}>{product.price} ₽</Typography>
          {itemExists ? (
            <LinkItem href="/cart">
              <Button variant="outlined">В корзину</Button>
            </LinkItem>
          ) : (
            <Button
              variant="contained"
              disabled={product.inStock > 0 ? false : true}
              onClick={openSizeDialog}>
              Купить
            </Button>
          )}
        </CardActions>
      </Card>
      <SizeDialog open={open} onClose={toggleSizeDialog} product={product} />
    </>
  );
};
