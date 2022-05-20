import { Card, CardContent, CardMedia, Typography } from '@mui/material';
import React from 'react';
import { ICategory } from '../../types/category';
import { IType } from '../../types/type';
import { LinkItem } from '../LinkItem';
import styles from './CatalogCard.module.scss';

interface IProps {
  data: IType | ICategory;
  image: string;
  href: string;
}

export const CatalogCard: React.FC<IProps> = ({ data, image, href }) => {
  return (
    <Card className={styles.root}>
      <LinkItem href={href}>
        <CardMedia component="img" image={image + data.image} alt={data.name} />
        <CardContent className={styles.content}>
          <Typography gutterBottom variant="h5" component="div">
            {data.name}
          </Typography>
        </CardContent>
      </LinkItem>
    </Card>
  );
};
