import { Typography } from '@mui/material';
import { GetServerSideProps, NextPage } from 'next';
import { ParsedUrlQuery } from 'querystring';
import React from 'react';
import MainLayout from '../../layouts/MainLayout';
import { IDepartment } from '../../types/department';
import { Api } from '../../utils/api';

interface IParams extends ParsedUrlQuery {
  slug: string;
}

interface II {
  department: IDepartment;
}

const Department: NextPage<II> = ({ department }) => {
  console.log(department);

  return (
    <MainLayout>
      <Typography variant="h4" sx={{ marginBottom: '30px' }}>
        {/* {department?.id === 1 ? 'Мужской отдел' : 'Женский отдел'} */}
        {/* {department.name} */}
      </Typography>
    </MainLayout>
  );
};

export const getServerSideProps: GetServerSideProps = async (ctx) => {
  try {
    const { slug } = ctx.params as IParams;
    // const slug = ctx.params.slug;
    const department = await Api(ctx).department.getBySlug(slug);
    return { props: { department } };
  } catch (error: any) {
    console.log(error.response.data.message);
    return { props: {} };
  }
};

export default Department;
