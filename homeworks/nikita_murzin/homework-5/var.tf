variable "region" {
  type        = string
  default     = "eu-west-1"
  description = "Define AWS region"
}

variable "access_key" {
  type        = string
  description = "Access key for your AWS account"
}

variable "secret_key" {
  type        = string
  description = "Secret key for your AWS account"
}