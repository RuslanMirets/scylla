import '../styles/globals.scss';
import type { AppProps } from 'next/app';
import { ThemeProvider } from '@mui/material';
import { theme } from '../theme';
import { wrapper } from '../store';
import { getMe } from '../store/actions/user';
import { getDepartments } from '../store/actions/department';

function App({ Component, pageProps }: AppProps) {
  return (
    <ThemeProvider theme={theme}>
      <Component {...pageProps} />
    </ThemeProvider>
  );
}

App.getInitialProps = wrapper.getInitialAppProps((store) => async ({ ctx }) => {
  await store.dispatch(getMe(ctx));
  await store.dispatch(getDepartments());
  return { pageProps: {} };
});

export default wrapper.withRedux(App);
