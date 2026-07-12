import type { Metadata } from 'next';
import React from 'react';

export const metadata: Metadata = {
  title: 'DevOpsHub',
  description: 'Enterprise DevOps SaaS platform',
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body style={{ margin: 0, fontFamily: 'Arial, sans-serif', background: '#07111f', color: '#f8fafc' }}>
        {children}
      </body>
    </html>
  );
}
