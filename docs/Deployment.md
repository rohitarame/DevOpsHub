# Deployment Guide

## Prerequisites
- AWS CLI configured with a deployment account
- Terraform 1.6+
- kubectl
- Docker
- Jenkins with credentials for AWS, Docker, and kubeconfig

## Terraform
1. Create an S3 bucket and DynamoDB table for Terraform state.
2. Update the backend block in [terraform/versions.tf](terraform/versions.tf) if needed.
3. Apply the infrastructure:
   - terraform -chdir=terraform init
   - terraform -chdir=terraform plan
   - terraform -chdir=terraform apply

## Kubernetes
1. Create the namespace and deploy manifests:
   - kubectl apply -f k8s/
2. Verify the rollout:
   - kubectl get pods -n devopshub
   - kubectl get ingress -n devopshub

## CI/CD
- Jenkins pipelines are available in [Jenkinsfile](Jenkinsfile) and [Jenkinsfile-terraform](Jenkinsfile-terraform).
- The pipeline provisions infrastructure, builds application artifacts, pushes to ECR, and applies Kubernetes manifests.
