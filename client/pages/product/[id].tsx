import { Typography } from '@mui/material';
import { NextPage } from 'next';
import { ParsedUrlQuery } from 'querystring';
import React from 'react';
import { ProductDetail } from '../../components/ProductDetail';
import MainLayout from '../../layouts/MainLayout';
import { wrapper } from '../../store';
import { getProductById } from '../../store/actions/product';
import { useAppSelector } from '../../store/hooks';

interface ICtxParams extends ParsedUrlQuery {
  id: string;
}

const ProductDetailPage: NextPage = () => {
  const { product } = useAppSelector((state) => state.product);

  return (
    <MainLayout title={product?.title}>
      <Typography variant="h4" sx={{ marginBottom: '20px' }}>
        {product?.title}
      </Typography>
      <ProductDetail product={product!} />
    </MainLayout>
  );
};

export const getServerSideProps = wrapper.getServerSideProps((store) => async (context) => {
  const { id } = context.params as ICtxParams;
  await store.dispatch(getProductById(id));
  return { props: {} };
});

export default ProductDetailPage;
