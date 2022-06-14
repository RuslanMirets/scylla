import { Checkbox, FormControl, FormControlLabel } from '@mui/material';
import { FC } from 'react';
import { useFormContext } from 'react-hook-form';

interface IProps {
  key: any;
  value: any;
  label: any;
  name: any;
  props?: any;
}

export const CheckboxField: FC<IProps> = ({ key, value, label, name, ...props }) => {
  const { register } = useFormContext();
  return (
    <FormControl>
      <FormControlLabel
        label={label}
        value={value}
        control={<Checkbox color="primary" />}
        // {...props}
        {...register(name)}
      />
    </FormControl>
  );
};
