import { Typography } from '@mui/material';
import { Box } from '@mui/system';
import { GetServerSideProps, NextPage } from 'next';
import { ParsedUrlQuery } from 'querystring';
import React from 'react';
import { ProductCard } from '../../../../components/ProductCard';
import MainLayout from '../../../../layouts/MainLayout';
import { ICategory } from '../../../../types/category';
import { IProduct } from '../../../../types/product';
import { Api } from '../../../../utils/api';

interface ICtxParams extends ParsedUrlQuery {
  slug: string;
}

interface IParams {
  category: ICategory;
  products: IProduct[];
}

const Product: NextPage<IParams> = ({ category, products }) => {
  return (
    <MainLayout title={category.description}>
      <Typography variant="h4" sx={{ marginBottom: '30px' }}>
        {category.name}
      </Typography>
      <Box className="product-list">
        {products.map((product) => (
          <ProductCard key={product.id} product={product} />
        ))}
      </Box>
    </MainLayout>
  );
};

export const getServerSideProps: GetServerSideProps = async (ctx) => {
  try {
    const { slug } = ctx.params as ICtxParams;
    const category = await Api(ctx).category.getOneBySlug(slug);
    const products = await Api(ctx).product.getAllByCategory(slug);
    return { props: { category, products } };
  } catch (error: any) {
    console.log(error.response.data.message);
    return { props: {} };
  }
};

export default Product;
