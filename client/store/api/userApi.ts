import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react';
import { IUser } from '../../types/user';

export const userApi = createApi({
  reducerPath: 'userApi',
  baseQuery: fetchBaseQuery({ baseUrl: 'http://localhost:5000' }),
  endpoints: (builder) => ({
    getUsers: builder.query<IUser[], void>({
      query: () => 'user',
    }),
  }),
});

export const { useGetUsersQuery } = userApi;
