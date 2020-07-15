locals {
  bucket_settings = {
    bucket = "my-random-bucket-123"
    acl    = "public-read"
  }
  files = ["manul.jpg", "index.html", "error.html"]
}

variable "secret_key" {
  type        = string
  description = "access key id for AWS account"
}

variable "secret_id" {
  type        = string
  description = "access secret key for AWS account"
}

variable "region" {
  type        = string
  description = "Define aws region"
  default     = "eu-west-1"
}
