# Terraform backend configuration is stored in versions.tf.
# Create the S3 bucket and DynamoDB table before the first run.
terraform {
  backend "s3" {
    bucket         = "devopshub-terraform-state1
    key            = "prod/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}