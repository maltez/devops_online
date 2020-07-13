variable "aws_region" {
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

variable "az_count" {
  description = "Number of AZs to cover in a given AWS region"
  default     = "2"
}

variable "app_image" {
  description = "Docker image to run in the ECS cluster"
  default     = "lazyk/simple-bash-webserver:latest"
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 8080
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = 4
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision"
  default     = "1024"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision"
  default     = "512"
}
