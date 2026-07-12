# DevOpsHub

DevOpsHub is a production-ready SaaS platform foundation for deploying a React frontend, a backend API, and managed infrastructure on AWS with Kubernetes and Jenkins.

## What is included
- Terraform for AWS VPC, EKS, ECR, S3, CloudFront, RDS, IAM, monitoring, and optional Route53
- Kubernetes manifests for deployments, services, ingress, autoscaling, PDB, network policy, and secrets
- Jenkins pipelines for infrastructure and application delivery
- Production-oriented frontend and backend deployment assets

## Architecture
- Frontend: React + TypeScript + Vite
- Backend: Go + Clean Architecture
- Infrastructure: AWS EKS, RDS PostgreSQL, S3, CloudFront, ECR, CloudWatch
- Delivery: Jenkins, Docker, Kubernetes

## Quick start
1. Configure AWS credentials and Terraform backend resources.
2. Run the Terraform deployment:
   - terraform -chdir=terraform init
   - terraform -chdir=terraform plan
   - terraform -chdir=terraform apply
3. Deploy Kubernetes resources:
   - kubectl apply -f k8s/
4. Build and deploy the application with Jenkins or the helper script:
   - ./scripts/deploy.sh

## Security
- Least-privilege IAM roles
- Secrets stored in Kubernetes secrets
- Non-root container guidance
- ECR image scanning and CloudWatch logging

## Documentation
- See [docs/Deployment.md](docs/Deployment.md)
- See [docs/architecture/overview.md](docs/architecture/overview.md)
- See [docs/DisasterRecovery.md](docs/DisasterRecovery.md)