import { NextPage } from 'next';
import React from 'react';
import { AdminProduct } from '../../components/Admin/AdminProduct';
import MainLayout from '../../layouts/MainLayout';
import { wrapper } from '../../store';
import { getBrands } from '../../store/actions/brand';
import { getCategories } from '../../store/actions/category';
import { getColors } from '../../store/actions/colors';
import { getSizes } from '../../store/actions/size';

const ProductAdmin: NextPage = () => {
  return (
    <MainLayout title="Панель администратора">
      <AdminProduct />
    </MainLayout>
  );
};

export const getServerSideProps = wrapper.getServerSideProps((store) => async (context) => {
  await store.dispatch(getCategories());
  await store.dispatch(getBrands());
  await store.dispatch(getColors());
  await store.dispatch(getSizes());
  return { props: {} };
});

export default ProductAdmin;
