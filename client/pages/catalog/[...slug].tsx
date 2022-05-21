import { Box, Typography } from '@mui/material';
import { NextPage } from 'next';
import { ParsedUrlQuery } from 'querystring';
import React from 'react';
import { CatalogCard } from '../../components/CatalogCard';
import MainLayout from '../../layouts/MainLayout';
import { wrapper } from '../../store';
import { getDepartmentBySlug } from '../../store/actions/department';
import { getTypesByDepartment } from '../../store/actions/type';
import { useAppSelector } from '../../store/hooks';
import { typeImage } from '../../utils/constants';

interface ICtxParams extends ParsedUrlQuery {
  slug: string;
}

const Department: NextPage = () => {
  const { department } = useAppSelector((state) => state.department);
  const { types } = useAppSelector((state) => state.type);

  return (
    <MainLayout title={department?.name === 'Мужчины' ? 'Мужской отдел' : 'Женский отдел'}>
      <Typography variant="h4" sx={{ marginBottom: '30px' }}>
        {department?.id === 1 ? 'Мужской отдел' : 'Женский отдел'}
      </Typography>
      <Box className="catalog-list">
        {types.map((type) => (
          <CatalogCard
            key={type.id}
            data={type}
            href={`/catalog/${department?.slug}/${type.slug}`}
            image={typeImage}
          />
        ))}
      </Box>
    </MainLayout>
  );
};

export const getServerSideProps = wrapper.getServerSideProps((store) => async (context) => {
  const { slug } = context.params as ICtxParams;
  await store.dispatch(getDepartmentBySlug(slug));
  await store.dispatch(getTypesByDepartment(slug));
  return { props: {} };
});

export default Department;
