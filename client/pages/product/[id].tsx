import { Typography } from '@mui/material';
import { NextPage } from 'next';
import { ParsedUrlQuery } from 'querystring';
import React from 'react';
import { ProductDetail } from '../../components/ProductDetail';
import { SimilarProducts } from '../../components/SimilarProducts';
import MainLayout from '../../layouts/MainLayout';
import { wrapper } from '../../store';
import { getCategoryByProduct } from '../../store/actions/category';
import { getProductById, getSimilarProducts } from '../../store/actions/product';
import { useAppSelector } from '../../store/hooks';
import { getAPI } from '../../utils/fetchData';

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
      <SimilarProducts />
    </MainLayout>
  );
};

export const getServerSideProps = wrapper.getServerSideProps((store) => async (context) => {
  const { id } = context.params as ICtxParams;
  const { data } = await getAPI(`category/product/${id}`);
  
  await store.dispatch(getProductById(id));
  await store.dispatch(getSimilarProducts(data.slug, id));
  return { props: {} };
});

export default ProductDetailPage;
