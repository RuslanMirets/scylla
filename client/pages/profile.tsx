import { NextPage } from 'next';
import React from 'react';
import MainLayout from '../layouts/MainLayout';
import { useAppSelector } from '../redux/hooks';
import { selectUserData } from '../redux/slices/user';

const Profile: NextPage = () => {
  const user = useAppSelector(selectUserData);
  return <MainLayout title="Профиль">{user?.name}</MainLayout>;
};

export default Profile;
