variable "secret_key" {
  type        = string
  description = "Access key for your AWS account"
}

variable "secret_id" {
  type        = string
  description = "Secret key for your AWS account"
}

variable "region" {
  type = string
  description = "Define AWS region"
  default = "eu-west-1"
}

variable "instance-ami" {
  type = string
  description = "Define image for instance"
  default = "ami-0ea3405d2d2522162"
}
