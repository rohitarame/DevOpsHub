'use client';

import { useEffect, useState } from 'react';
import axios from 'axios';
import './globals.css';

interface DashboardSummary {
  status: string;
  message: string;
  deployments: number;
  containers: number;
  clusters: number;
}

export default function HomePage() {
  const [summary, setSummary] = useState<DashboardSummary | null>(null);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    axios.get<DashboardSummary>('http://api.thedevopslab.online/api/dashboard')
      .then((response) => setSummary(response.data))
      .catch(() => setError("Backend unavailable."));
  }, []);

  return (
    <main style={{ minHeight: '100vh', display: 'flex', alignItems: 'center', justifyContent: 'center', background: 'linear-gradient(135deg, #07111f, #0f172a)' }}>
      <section style={{ width: 'min(980px, 92vw)', padding: 32, borderRadius: 24, background: 'rgba(15,23,42,0.85)', boxShadow: '0 20px 50px rgba(0,0,0,0.25)', border: '1px solid rgba(56,189,248,0.2)' }}>
        <p style={{ textTransform: 'uppercase', letterSpacing: '0.3em', color: '#38bdf8', marginBottom: 12, fontSize: '0.78rem' }}>DevOpsHub</p>
        <h1 style={{ fontSize: '2.2rem', margin: '0 0 12px' }}>Enterprise platform for deployments, containers, and Kubernetes</h1>
        <p style={{ color: '#cbd5e1', lineHeight: 1.7 }}>
          A self-hosted PaaS for teams that need GitHub integration, Docker management, Kubernetes operations, observability, and secure deployments from one dashboard.
        </p>

        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(180px, 1fr))', gap: 16, marginTop: 24 }}>
          {summary ? (
            <>
              <div style={{ padding: 18, borderRadius: 16, background: '#020617', border: '1px solid #1e293b' }}>
                <div style={{ color: '#94a3b8', fontSize: '0.8rem' }}>Status</div>
                <div style={{ fontSize: '1.1rem', marginTop: 6 }}>{summary.status}</div>
              </div>
              <div style={{ padding: 18, borderRadius: 16, background: '#020617', border: '1px solid #1e293b' }}>
                <div style={{ color: '#94a3b8', fontSize: '0.8rem' }}>Deployments</div>
                <div style={{ fontSize: '1.1rem', marginTop: 6 }}>{summary.deployments}</div>
              </div>
              <div style={{ padding: 18, borderRadius: 16, background: '#020617', border: '1px solid #1e293b' }}>
                <div style={{ color: '#94a3b8', fontSize: '0.8rem' }}>Containers</div>
                <div style={{ fontSize: '1.1rem', marginTop: 6 }}>{summary.containers}</div>
              </div>
              <div style={{ padding: 18, borderRadius: 16, background: '#020617', border: '1px solid #1e293b' }}>
                <div style={{ color: '#94a3b8', fontSize: '0.8rem' }}>Clusters</div>
                <div style={{ fontSize: '1.1rem', marginTop: 6 }}>{summary.clusters}</div>
              </div>
            </>
          ) : (
            <div style={{ gridColumn: '1 / -1', padding: 20, borderRadius: 16, background: '#020617', border: '1px solid #1e293b' }}>
              {error ? <strong>{error}</strong> : <strong>Loading dashboard...</strong>}
            </div>
          )}
        </div>
      </section>
    </main>
  );
}
