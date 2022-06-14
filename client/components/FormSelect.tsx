import { TextField } from '@mui/material';
import React from 'react';
import { useFormContext } from 'react-hook-form';

interface IProps {
  children: any;
  name: string;
  label: string;
  defaultValue?: any;
}

export const FormSelect: React.FC<IProps> = ({ children, name, label, defaultValue }) => {
  const { register, formState } = useFormContext();

  return (
    <TextField
      size="small"
      select
      fullWidth
      defaultValue={defaultValue}
      label={label}
      inputProps={register(name)}
      error={!!formState.errors[name]?.message}
      helperText={formState.errors[name]?.message}>
      {children}
    </TextField>
  );
};
