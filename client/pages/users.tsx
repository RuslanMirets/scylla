import {
  Paper,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Typography,
} from '@mui/material';
import { NextPage } from 'next';
import React from 'react';
import MainLayout from '../layouts/MainLayout';
import { userApi } from '../store/api/userApi';

const Users: NextPage = () => {
  const { data, isLoading, isSuccess } = userApi.useGetUsersQuery();

  return (
    <MainLayout title="Пользователи">
      <Typography variant="h5" sx={{ marginBottom: '20px' }}>
        Пользователи
      </Typography>
      {isLoading && <h1>Loading...</h1>}
      {isSuccess && (
        <TableContainer component={Paper}>
          <Table sx={{ minWidth: 650 }} aria-label="simple table">
            <TableHead>
              <TableRow>
                <TableCell>Имя</TableCell>
                <TableCell>Email</TableCell>
                <TableCell>Роль</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {data?.map((user) => (
                <TableRow key={user.id} sx={{ '&:last-child td, &:last-child th': { border: 0 } }}>
                  <TableCell>{user.name}</TableCell>
                  <TableCell>{user.email}</TableCell>
                  <TableCell>{user.role[0].description}</TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </TableContainer>
      )}
    </MainLayout>
  );
};

export default Users;
