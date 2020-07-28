variable "secret_key" {
  type = string
  description = "Access key ID"
}

variable "secret_id" {
  type = string
  description = "Secret access key"
}

variable "region" {
  description = "AWS region"
  type = string
  default = "us-east-2"
}
