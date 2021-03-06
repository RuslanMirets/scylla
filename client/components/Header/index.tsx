import { AppBar, Badge, Box, IconButton, Toolbar, Typography } from '@mui/material';
import LogoutIcon from '@mui/icons-material/Logout';
import AccountCircleIcon from '@mui/icons-material/AccountCircle';
import ShoppingBasketIcon from '@mui/icons-material/ShoppingBasket';
import LoginIcon from '@mui/icons-material/Login';
import { Container } from '@mui/system';
import React from 'react';
import { LinkItem } from '../LinkItem';
import { NavItem } from '../NavItem';
import styles from './Header.module.scss';
import { AuthDialog } from '../AuthDialog';
import { useAppDispatch, useAppSelector } from '../../store/hooks';
import { logout } from '../../store/actions/user';

const pages = [
  { title: 'Главная', href: '/' },
  { title: 'Пользователи', href: '/users' },
];

export const Header: React.FC = () => {
  const dispatch = useAppDispatch();
  const { user, registerData } = useAppSelector((state) => state.user);
  const { departments } = useAppSelector((state) => state.department);
  const { cartData } = useAppSelector((state) => state.cart);

  const [open, setOpen] = React.useState(false);
  const toggleAuthDialog = () => {
    setOpen(!open);
  };
  const openAuthDialog = () => {
    toggleAuthDialog();
  };

  const handleLogout = () => {
    dispatch(logout());
  };

  React.useEffect(() => {
    if (user || registerData) {
      setOpen(false);
    }
  }, [user, registerData]);

  return (
    <AppBar className={styles.root}>
      <Container>
        <Toolbar className={styles.toolbar} disableGutters>
          <LinkItem className={styles.logo} href="/">
            <Typography variant="h5">Scylla</Typography>
          </LinkItem>
          <Box className={styles.menu}>
            {pages.map((page) => (
              <NavItem key={page.title} title={page.title} href={page.href} />
            ))}
            {departments.map((department) => (
              <NavItem
                key={department.id}
                title={department.id === 1 ? 'Мужчинам' : 'Женщинам'}
                href={`/catalog/${department.slug}`}
              />
            ))}
          </Box>
          <Box className={styles.actions}>
            <LinkItem href="/cart">
              <IconButton>
                <Badge badgeContent={`${cartData.length}`} color="error">
                  <ShoppingBasketIcon />
                </Badge>
              </IconButton>
            </LinkItem>
            {user ? (
              <>
                <LinkItem href="/profile">
                  <IconButton>
                    <AccountCircleIcon />
                  </IconButton>
                </LinkItem>
                <IconButton onClick={handleLogout}>
                  <LogoutIcon />
                </IconButton>
              </>
            ) : (
              <IconButton onClick={openAuthDialog}>
                <LoginIcon />
              </IconButton>
            )}
          </Box>
        </Toolbar>
      </Container>
      <AuthDialog open={open} onClose={toggleAuthDialog} />
    </AppBar>
  );
};
