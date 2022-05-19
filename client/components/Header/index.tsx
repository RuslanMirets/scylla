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

const pages = [
  { title: 'Главная', href: '/' },
  { title: 'Пользователи', href: '/users' },
];

export const Header: React.FC = () => {
  const user = true;

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
          </Box>
          <Box className={styles.actions}>
            <LinkItem href="/cart">
              <IconButton>
                <Badge badgeContent={99} color="error">
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
                <IconButton>
                  <LogoutIcon />
                </IconButton>
              </>
            ) : (
              <IconButton>
                <LoginIcon />
              </IconButton>
            )}
          </Box>
        </Toolbar>
      </Container>
    </AppBar>
  );
};
