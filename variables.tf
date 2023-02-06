variable "cert_arn" {}

variable "container_definitions" {}

variable "cpu" {
  default = 256
}

variable "desired_count" {
  default = 1
}

variable "domain_name" {}

variable "exec_role_arn" {
  default = ""
}

variable "health_check_matcher" {
  default = "200"
}

variable "health_check_path" {
  default = "/"
}

variable "lb_enabled" {
  default = true
}

variable "log_retention_days" {
  default = 30
}

variable "memory" {
  default = 512
}

variable "name" {}

variable "subnet_ids" {}

variable "vpc_id" {}

