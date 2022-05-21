import { Typography } from '@mui/material';
import { Box } from '@mui/system';
import { NextPage } from 'next';
import { ParsedUrlQuery } from 'querystring';
import React from 'react';
import { ProductCard } from '../../../../components/ProductCard';
import MainLayout from '../../../../layouts/MainLayout';
import { wrapper } from '../../../../store';
import { getCategoryBySlug } from '../../../../store/actions/category';
import { getProductsByCategory } from '../../../../store/actions/product';
import { useAppSelector } from '../../../../store/hooks';

interface ICtxParams extends ParsedUrlQuery {
  slug: string;
}

const Product: NextPage = () => {
  const { category } = useAppSelector((state) => state.category);
  const { products } = useAppSelector((state) => state.product);

  return (
    <MainLayout title={category?.description}>
      <Typography variant="h4" sx={{ marginBottom: '30px' }}>
        {category?.name}
      </Typography>
      <Box className="product-list">
        {products.map((product) => (
          <ProductCard key={product.id} product={product} />
        ))}
      </Box>
    </MainLayout>
  );
};

export const getServerSideProps = wrapper.getServerSideProps((store) => async (context) => {
  const { slug } = context.params as ICtxParams;
  await store.dispatch(getCategoryBySlug(slug));
  await store.dispatch(getProductsByCategory(slug));
  return { props: {} };
});

export default Product;
