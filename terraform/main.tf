# Root module entrypoint for the production networking and EKS infrastructure.
module "vpc" {
  source = "./modules/vpc"

  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  region               = var.region
}

module "eks" {
  source = "./modules/eks"

  project_name                = var.project_name
  environment                 = var.environment
  region                      = var.region
  cluster_version             = var.cluster_version
  vpc_id                      = module.vpc.vpc_id
  private_subnet_ids          = module.vpc.private_subnet_ids
  public_subnet_ids           = module.vpc.public_subnet_ids
  node_group_instance_types   = var.node_group_instance_types
  node_group_desired_capacity = var.node_group_desired_capacity
}
