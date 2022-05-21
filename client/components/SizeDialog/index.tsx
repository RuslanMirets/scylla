import {
  Box,
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  IconButton,
  Typography,
} from '@mui/material';
import CloseIcon from '@mui/icons-material/Close';
import React from 'react';
import styles from './SizeDialog.module.scss';
import { IProduct } from '../../types/product';
import classnames from 'classnames';
import { useAppDispatch } from '../../redux/hooks';
import { addToCart } from '../../redux/slices/cart';

interface IProps {
  open: boolean;
  onClose: () => void;
  product: IProduct;
}

export const SizeDialog: React.FC<IProps> = ({ open, onClose, product }) => {
  const dispatch = useAppDispatch();

  const [size, setSize] = React.useState(product.size[0].value);
  const isActiveSize = (index: any) => {
    if (size === index) return styles.active;
    return '';
  };

  const handleAddToCart = () => {
    dispatch(addToCart({ ...product, selectedSize: size }));
    onClose();
  };

  return (
    <Dialog className={styles.root} open={open} onClose={onClose} maxWidth="xs" fullWidth>
      <DialogTitle>
        <Typography variant="h5" component="div">
          Выберите размер
        </Typography>
        <IconButton className={styles.close} onClick={onClose}>
          <CloseIcon />
        </IconButton>
      </DialogTitle>
      <DialogContent dividers>
        <Box>
          Размеры:
          <Box className={styles.sizeItems}>
            {product.size.map((item) => (
              <Typography
                variant="subtitle1"
                component="span"
                className={classnames(styles.sizeItem, isActiveSize(item.value))}
                key={item.value}
                onClick={() => setSize(item.value)}>
                {item.value}
              </Typography>
            ))}
          </Box>
        </Box>
      </DialogContent>
      <DialogActions>
        <Button variant="contained" onClick={handleAddToCart}>
          Купить
        </Button>
      </DialogActions>
    </Dialog>
  );
};
