import '../styles/globals.scss';
import type { AppProps } from 'next/app';
import { wrapper } from '../redux/store';
import { login } from '../redux/slices/user';
import { Api } from '../utils/api';
import { ThemeProvider } from '@mui/material';
import { theme } from '../theme';
import { setDepartment } from '../redux/slices/department';

function App({ Component, pageProps }: AppProps) {
  return (
    <ThemeProvider theme={theme}>
      <Component {...pageProps} />
    </ThemeProvider>
  );
}

App.getInitialProps = wrapper.getInitialAppProps((store) => async ({ ctx, Component }) => {
  try {
    const userData = await Api(ctx).user.getMe();
    store.dispatch(login(userData));
    const departments = await Api(ctx).department.getAll();
    store.dispatch(setDepartment(departments));
  } catch (error: any) {
    console.log(error.response.data.message);
  }

  return {
    pageProps: Component.getInitialProps ? await Component.getInitialProps({ ...ctx, store }) : {},
  };
});

export default wrapper.withRedux(App);
