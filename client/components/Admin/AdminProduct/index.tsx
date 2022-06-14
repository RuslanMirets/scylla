import { Typography, Button, Box, Paper, MenuItem, IconButton } from '@mui/material';
import PhotoCameraIcon from '@mui/icons-material/PhotoCamera';
import { ChangeEvent, FC, useState } from 'react';
import { useForm, FormProvider } from 'react-hook-form';
import { useAppDispatch, useAppSelector } from '../../../store/hooks';
import { CheckboxField } from '../../CheckboxField';
import { FormField } from '../../FormField';
import { FormFile } from '../../FormFile';
import { FormSelect } from '../../FormSelect';
import styles from './AdminProduct.module.scss';
import { createProduct } from '../../../store/actions/product';

export const AdminProduct: FC = () => {
  const dispatch = useAppDispatch();

  const { categories } = useAppSelector((state) => state.category);
  const { brands } = useAppSelector((state) => state.brand);
  const { colors } = useAppSelector((state) => state.color);
  const { sizes } = useAppSelector((state) => state.size);

  const initialState = {
    image: '' as any,
  };

  const [data, setData] = useState(initialState);
  const { image } = data;

  const changeImage = (e: ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    setData({ ...data, image: file });
  };

  const methods = useForm({
    mode: 'onChange',
    reValidateMode: 'onChange',
    // resolver: yupResolver(),
  });

  const onSubmit = (data: any) => {
    dispatch(createProduct(data));
    console.log(data);
  };

  return (
    <Box className={styles.root}>
      <Typography variant="h4">Товар</Typography>
      <Paper className={styles.paper}>
        <FormProvider {...methods}>
          <form onSubmit={methods.handleSubmit(onSubmit)}>
            <FormField type="text" label="Название" name="title" />
            <FormField type="number" label="Цена" name="price" />
            <FormField type="text" label="Описание" name="description" multiline maxRows={5} />
            <FormField type="number" label="Количество" name="inStock" />
            <FormSelect name="categoryId" label="Категория">
              {categories.map((category) => (
                <MenuItem key={category.id} value={category.id}>
                  {category.description}
                </MenuItem>
              ))}
            </FormSelect>
            <FormSelect name="brandId" label="Бренд">
              {brands.map((brand) => (
                <MenuItem key={brand.id} value={brand.id}>
                  {brand.name}
                </MenuItem>
              ))}
            </FormSelect>
            <div>
              {colors.map((color) => (
                <CheckboxField key={color.id} name="colorId" label={color.name} value={color.id} />
              ))}
            </div>
            <div>
              {sizes.map((size) => (
                <CheckboxField key={size.id} name="sizeId" label={size.value} value={size.id} />
              ))}
            </div>
            <div className={styles.upload}>
              <Typography className={styles.uploadTitle} variant="subtitle1">
                Изображение:
              </Typography>
              <div className={styles.image}>
                <img
                  src={image ? URL.createObjectURL(image) : '/assets/images/default-image.jpg'}
                  alt="Image"
                />
                <IconButton>
                  <PhotoCameraIcon />
                  <FormFile name="image" onChange={changeImage} />
                </IconButton>
              </div>
            </div>
            <Button
              disabled={!methods.formState.isValid || methods.formState.isSubmitting}
              type="submit"
              color="primary"
              variant="contained">
              Добавить
            </Button>
          </form>
        </FormProvider>
      </Paper>
    </Box>
  );
};
