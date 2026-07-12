# Architecture Overview

## Components
- Frontend hosted on CloudFront and S3
- Backend deployed to EKS with autoscaling
- PostgreSQL managed by Amazon RDS
- Observability via CloudWatch, Prometheus, and Grafana

## Traffic Flow
1. Users reach the React application through CloudFront.
2. API requests are routed to the backend service in EKS.
3. The backend stores data in Amazon RDS and uses Kubernetes secrets for sensitive values.
4. Logs and metrics are emitted to CloudWatch and Prometheus.
