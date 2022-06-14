import { Typography } from '@mui/material';
import { NextPage } from 'next';
import React from 'react';
import { LinkItem } from '../../components/LinkItem';
import MainLayout from '../../layouts/MainLayout';

const AdminPage: NextPage = () => {
  return (
    <MainLayout title="Панель администратора">
      <Typography variant="h4" sx={{ marginBottom: '20px' }}>
        Панель администратора
      </Typography>
      <LinkItem href="/admin/product">
        <Typography variant="h5">Продукты</Typography>
      </LinkItem>
    </MainLayout>
  );
};

export default AdminPage;
