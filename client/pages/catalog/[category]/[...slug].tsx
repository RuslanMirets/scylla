import { Typography } from '@mui/material';
import { Box } from '@mui/system';
import { GetServerSideProps } from 'next';
import { ParsedUrlQuery } from 'querystring';
import React from 'react';
import { CatalogCard } from '../../../components/CatalogCard';
import MainLayout from '../../../layouts/MainLayout';
import { ICategory } from '../../../types/category';
import { IDepartment } from '../../../types/department';
import { IType } from '../../../types/type';
import { Api } from '../../../utils/api';
import { categoryImage } from '../../../utils/constants';

interface IParams extends ParsedUrlQuery {
  slug: string;
}

interface ICategoryParams {
  type: IType;
  categories: ICategory[];
  department: IDepartment;
}

const Category: React.FC<ICategoryParams> = ({ type, categories, department }) => {
  return (
    <MainLayout title={type.description}>
      <Typography variant="h4" sx={{ marginBottom: '30px' }}>
        {type.name}
      </Typography>
      <Box className="catalog-list">
        {categories.map((category) => (
          <CatalogCard
            key={category.id}
            data={category}
            href={`/catalog/${department?.slug}/${type?.slug}/${category.slug}`}
            image={categoryImage}
          />
        ))}
      </Box>
    </MainLayout>
  );
};

export const getServerSideProps: GetServerSideProps = async (ctx) => {
  try {
    const { slug } = ctx.params as IParams;
    const type = await Api(ctx).type.getOneBySlug(slug);
    const categories = await Api(ctx).category.getAllByType(slug);
    const department = await Api(ctx).department.getOneByType(slug);
    return { props: { type, categories, department } };
  } catch (error: any) {
    console.log(error.response.data.message);
    return { props: {} };
  }
};

export default Category;
