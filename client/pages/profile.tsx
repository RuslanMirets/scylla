import { Typography } from '@mui/material';
import { NextPage } from 'next';
import React from 'react';
import MainLayout from '../layouts/MainLayout';
import { useAppSelector } from '../store/hooks';

const Profile: NextPage = () => {
  const { user } = useAppSelector((state) => state.user);

  return (
    <MainLayout title="Профиль">
      <Typography>
        {user?.name} | {user?.role[0].description}
      </Typography>
    </MainLayout>
  );
};

export default Profile;
