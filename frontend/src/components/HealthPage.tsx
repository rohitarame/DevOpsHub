import React, { useEffect, useState } from 'react';

const HealthPage: React.FC = () => {
  const [status, setStatus] = useState<'loading' | 'ok' | 'error'>('loading');
  const [message, setMessage] = useState('Checking service health...');

  useEffect(() => {
    const checkHealth = async () => {
      try {
        const response = await fetch(`${import.meta.env.VITE_API_URL ?? ''}/health`);
        if (response.ok) {
          setStatus('ok');
          setMessage('All services are healthy.');
        } else {
          setStatus('error');
          setMessage('The backend health check returned an error.');
        }
      } catch {
        setStatus('error');
        setMessage('Unable to reach the backend service.');
      }
    };

    checkHealth();
  }, []);

  return (
    <div style={{ padding: '2rem', fontFamily: 'sans-serif' }}>
      <h1>DevOpsHub Health</h1>
      <p>Status: {status}</p>
      <p>{message}</p>
    </div>
  );
};

export default HealthPage;
