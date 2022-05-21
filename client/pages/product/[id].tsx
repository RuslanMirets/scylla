import { Typography } from '@mui/material';
import { GetServerSideProps, NextPage } from 'next';
import { ParsedUrlQuery } from 'querystring';
import React from 'react';
import { ProductDetail } from '../../components/ProductDetail';
import MainLayout from '../../layouts/MainLayout';
import { IProduct } from '../../types/product';
import { Api } from '../../utils/api';

interface ICtxParams extends ParsedUrlQuery {
  id: string;
}

interface IParams {
  product: IProduct;
}

const ProductDetailPage: NextPage<IParams> = ({ product }) => {
  return (
    <MainLayout title={product.title}>
      <Typography variant="h4" sx={{ marginBottom: '20px' }}>
        {product.title}
      </Typography>
      <ProductDetail product={product} />
    </MainLayout>
  );
};

export const getServerSideProps: GetServerSideProps = async (ctx) => {
  try {
    const { id } = ctx.params as ICtxParams;
    const product = await Api(ctx).product.getOneById(id);
    return { props: { product } };
  } catch (error: any) {
    console.log(error.response.data.message);
    return { props: {} };
  }
};

export default ProductDetailPage;
