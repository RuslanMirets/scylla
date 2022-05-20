import { Box, Typography } from '@mui/material';
import { GetServerSideProps, NextPage } from 'next';
import { ParsedUrlQuery } from 'querystring';
import React from 'react';
import { CatalogCard } from '../../components/CatalogCard';
import MainLayout from '../../layouts/MainLayout';
import { IDepartment } from '../../types/department';
import { IType } from '../../types/type';
import { Api } from '../../utils/api';
import { typeImage } from '../../utils/constants';

interface ICtxParams extends ParsedUrlQuery {
  slug: string;
}

interface IParams {
  department: IDepartment;
  types: IType[];
}

const Department: NextPage<IParams> = ({ department, types }) => {
  return (
    <MainLayout title={department.name === 'Мужчины' ? 'Мужской отдел' : 'Женский отдел'}>
      <Typography variant="h4" sx={{ marginBottom: '30px' }}>
        {department.id === 1 ? 'Мужской отдел' : 'Женский отдел'}
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

export const getServerSideProps: GetServerSideProps = async (ctx) => {
  try {
    const { slug } = ctx.params as ICtxParams;
    const department = await Api(ctx).department.getOneBySlug(slug);
    const types = await Api(ctx).type.getAllByType(slug);
    return { props: { department, types } };
  } catch (error: any) {
    console.log(error.response.data.message);
    return { props: {} };
  }
};

export default Department;
