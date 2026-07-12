# Configure the AWS provider for the target region.
provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project     = "DevOpsHub"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"

  default_tags {
    tags = {
      Project     = "DevOpsHub"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}
