# Output values useful for downstream automation and access.
output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_arn" {
  description = "EKS cluster ARN"
  value       = module.eks.cluster_arn
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID for the frontend"
  value       = aws_cloudfront_distribution.frontend.id
}

output "cloudfront_domain_name" {
  description = "CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.frontend.domain_name
}

output "s3_bucket_name" {
  description = "Frontend S3 bucket name"
  value       = aws_s3_bucket.frontend.id
}

output "frontend_url" {
  description = "Primary frontend URL"
  value       = var.domain_name != "" ? "https://${var.domain_name}" : "https://${aws_cloudfront_distribution.frontend.domain_name}"
}

output "acm_certificate_arn" {
  description = "ACM certificate ARN for the custom domain"
  value       = var.domain_name != "" ? aws_acm_certificate_validation.frontend[0].certificate_arn : null
}

output "route53_zone_id" {
  description = "Route53 hosted zone ID used for the custom domain"
  value       = var.domain_name != "" ? local.route53_zone_id : null
}

output "backend_ecr_repository_url" {
  value = aws_ecr_repository.backend.repository_url
}

output "frontend_ecr_repository_url" {
  value = aws_ecr_repository.frontend.repository_url
}
