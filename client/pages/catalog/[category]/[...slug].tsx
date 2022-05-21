import { Typography } from '@mui/material';
import { Box } from '@mui/system';
import { ParsedUrlQuery } from 'querystring';
import React from 'react';
import { CatalogCard } from '../../../components/CatalogCard';
import MainLayout from '../../../layouts/MainLayout';
import { wrapper } from '../../../store';
import { getCategoriesByType } from '../../../store/actions/category';
import { getDepartmentByType } from '../../../store/actions/department';
import { getTypeBySlug } from '../../../store/actions/type';
import { useAppSelector } from '../../../store/hooks';

import { categoryImage } from '../../../utils/constants';

interface ICtxParams extends ParsedUrlQuery {
  slug: string;
}

const Category: React.FC = () => {
  const { type } = useAppSelector((state) => state.type);
  const { categories } = useAppSelector((state) => state.category);
  const { department } = useAppSelector((state) => state.department);

  return (
    <MainLayout title={type?.description}>
      <Typography variant="h4" sx={{ marginBottom: '30px' }}>
        {type?.name}
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

export const getServerSideProps = wrapper.getServerSideProps((store) => async (context) => {
  const { slug } = context.params as ICtxParams;
  await store.dispatch(getTypeBySlug(slug));
  await store.dispatch(getCategoriesByType(slug));
  await store.dispatch(getDepartmentByType(slug));
  return { props: {} };
});

export default Category;
