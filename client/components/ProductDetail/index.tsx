import {
  Box,
  Button,
  CardActionArea,
  ImageList,
  ImageListItem,
  Paper,
  Typography,
} from '@mui/material';
import React from 'react';
import { IProduct } from '../../types/product';
import { productImage } from '../../utils/constants';
import classnames from 'classnames';
import styles from './ProductDetail.module.scss';

interface IProps {
  product: IProduct;
}

export const ProductDetail: React.FC<IProps> = ({ product }) => {
  const [image, setImage] = React.useState(0);
  const isActiveImage = (index: any) => {
    if (image === index) return styles.active;
    return '';
  };

  const [size, setSize] = React.useState(0);
  const isActiveSize = (index: any) => {
    if (size === index) return styles.active;
    return '';
  };

  return (
    <Paper className={styles.root}>
      <Box className={styles.body}>
        <Box className={styles.images}>
          <img
            className={styles.image}
            src={productImage + product.images[image]}
            alt={product.title}
          />
          <Box className={styles.imageList}>
            {product.images.map((image, index) => (
              <CardActionArea
                key={index}
                className={classnames(styles.thumbnail, isActiveImage(index))}
                onClick={() => setImage(index)}>
                <img src={productImage + image} alt={product.title} loading="lazy" />
              </CardActionArea>
            ))}
          </Box>
        </Box>
        <Box className={styles.info}>
          <Typography className={styles.price} variant="h5">
            {product.price} ₽
          </Typography>
          <Box className={styles.count}>
            {product.inStock > 0 ? (
              <Typography variant="subtitle1">В наличии: {product.inStock}</Typography>
            ) : (
              <Typography variant="subtitle1">Нет в наличии</Typography>
            )}
            <Typography variant="subtitle1">Продано: {product.sold}</Typography>
          </Box>
          <Typography className={styles.color} variant="subtitle1">
            Цвет:
            {product.color.map((item, index) => (
              <Typography variant="subtitle1" component="span" key={index}>
                {item.name}
              </Typography>
            ))}
          </Typography>
          <Typography className={styles.brand} variant="subtitle1">
            Бренд:
            <Typography variant="subtitle1" component="span">
              {product.brand.name}
            </Typography>
          </Typography>
          <Box>
            Размеры:
            <Box className={styles.sizeItems}>
              {product.size.map((item, index) => (
                <Typography
                  variant="subtitle1"
                  component="span"
                  className={classnames(styles.sizeItem, isActiveSize(index))}
                  key={index}
                  onClick={() => setSize(index)}>
                  {item.value}
                </Typography>
              ))}
            </Box>
          </Box>
          <Button
            className={styles.btn}
            variant="contained"
            disabled={product.inStock > 0 ? false : true}>
            Добавить в корзину
          </Button>
        </Box>
      </Box>
      <Typography className={styles.description} variant="body1">
        {product.description}
      </Typography>
    </Paper>
  );
};
