provider "aws" {
  region     = var.region
  access_key = var.secret_key
  secret_key = var.secret_id
}
