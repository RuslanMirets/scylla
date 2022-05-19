import Link from 'next/link';
import React from 'react';

interface IProps {
  href: string;
  className?: any;
  children: React.ReactNode;
}

export const LinkItem: React.FC<IProps> = ({ href, className, children }) => {
  return (
    <Link href={href}>
      <a className={className}>{children}</a>
    </Link>
  );
};
