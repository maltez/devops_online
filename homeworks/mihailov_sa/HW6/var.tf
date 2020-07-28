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

variable "app_port" {
  default = "80"
}

variable "fargate_cpu" {
  default = "256"
}

variable "fargate_memory" {
  default = "512"
}

variable "app_image" {
  default = "nginx:latest"
}
