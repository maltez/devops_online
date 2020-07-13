variable "region" {
  description = "AWS region"
  type = string
  default = "eu-west-1"
}
variable "secret_key" {
  type        = string
  description = "AWS Access key"
}
variable "secret_id" {
  type        = string
  description = "AWS Secret key"
}
