#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "[1/6] Terraform init"
terraform -chdir=terraform init -input=false

echo "[2/6] Terraform validate"
terraform -chdir=terraform validate

echo "[3/6] Terraform plan"
terraform -chdir=terraform plan -out=tfplan

echo "[4/6] Terraform apply"
terraform -chdir=terraform apply -auto-approve tfplan

echo "[5/6] Deploy Kubernetes manifests"
kubectl apply -f k8s/
echo "[6/6] Verify rollout"
kubectl get pods -n devopshub
kubectl get services -n devopshub
