# Input variables for the Terraform deployment.

variable "region" {
  description = "AWS region for the deployment"
  type        = string
  default     = "eu-north-1"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "prod"
}

variable "project_name" {
  description = "Name prefix for AWS resources"
  type        = string
  default     = "devopshub"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.10.1.0/24", "10.10.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.10.101.0/24", "10.10.102.0/24"]
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.30"
}

variable "node_group_instance_types" {
  description = "EC2 instance types for the managed node group"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_group_desired_capacity" {
  description = "Desired capacity for the managed node group"
  type        = number
  default     = 2
}

variable "domain_name" {
  description = "Custom domain for frontend"
  type        = string
  default     = "thedevopslab.online"
}

variable "route53_zone_id" {
  description = "Existing Route53 Hosted Zone ID"
  type        = string
  default     = "Z070903329VIS1J7CTQ7T"
}
