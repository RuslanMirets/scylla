import { Box, Typography } from '@mui/material';
import { FC } from 'react';
import { useAppSelector } from '../../store/hooks';
import { ProductCard } from '../ProductCard';
import styles from './SimilarProducts.module.scss';

export const SimilarProducts: FC = () => {
  const { products } = useAppSelector((state) => state.product);

  return (
    <Box className={styles.root}>
      <Typography variant="h5">Похожие товары</Typography>
      <Box className="product-list">
        {products.map((product) => (
          <ProductCard key={product.id} product={product} />
        ))}
      </Box>
    </Box>
  );
};
