variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
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

variable "app_domain" {
  type    = string
  default = "devops_course_domain.local"
}