import {
  Dialog,
  DialogTitle,
  Typography,
  IconButton,
  DialogContent,
  DialogActions,
  Button,
} from '@mui/material';
import CloseIcon from '@mui/icons-material/Close';
import React from 'react';
import styles from './ClearCartDialog.module.scss';
import { useAppDispatch } from '../../store/hooks';
import { clearCart } from '../../store/slices/cart';

interface IProps {
  open: boolean;
  onClose: () => void;
}

export const ClearCartDialog: React.FC<IProps> = ({ open, onClose }) => {
  const dispatch = useAppDispatch();

  const handleClear = () => {
    dispatch(clearCart());
    onClose();
  };

  return (
    <Dialog className={styles.root} open={open} onClose={onClose} maxWidth="xs" fullWidth>
      <DialogTitle>
        <Typography variant="h5" component="div">
          Удаление
        </Typography>
        <IconButton className={styles.close} onClick={onClose}>
          <CloseIcon />
        </IconButton>
      </DialogTitle>
      <DialogContent dividers>
        <Typography variant="body1">Вы действительно хотите очистить корзину?</Typography>
      </DialogContent>
      <DialogActions>
        <Button variant="outlined" onClick={onClose}>
          Отмена
        </Button>
        <Button variant="contained" color="error" onClick={handleClear}>
          Очистить
        </Button>
      </DialogActions>
    </Dialog>
  );
};
