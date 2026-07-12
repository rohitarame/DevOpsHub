# Disaster Recovery Plan

## Backup Strategy
- Enable automatic backups for RDS PostgreSQL.
- Enable S3 versioning for the frontend bucket.
- Store Terraform state remotely in S3 with DynamoDB locking.

## Recovery Steps
1. Recreate the AWS infrastructure from Terraform.
2. Restore the database from the latest automated snapshot if required.
3. Redeploy Kubernetes resources and application images.
4. Invalidate CloudFront cache and validate the frontend health endpoint.
