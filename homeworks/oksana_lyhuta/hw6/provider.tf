# Specify the provider and access details
provider "aws" {
  region     = var.aws_region
  secret_key = var.secret_key
  #secret_id = var.secret_id
}

