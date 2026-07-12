terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }

  # Remote state backend configuration.
  # Replace the bucket name with your own globally unique S3 bucket.
  backend "s3" {
    bucket         = "devopshub-terraform-state-north"
    key            = "prod/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "devopshub-terraform-locks"
    encrypt        = true
  }
}
