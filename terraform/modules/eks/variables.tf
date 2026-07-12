variable "project_name" {
  description = "Name prefix for the EKS cluster"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the cluster will be created"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for the EKS node groups"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for the control plane networking"
  type        = list(string)
}

variable "node_group_instance_types" {
  description = "EC2 instance types for the managed node group"
  type        = list(string)
}

variable "node_group_desired_capacity" {
  description = "Desired node capacity for the managed node group"
  type        = number
}
