variable "env" {
  default = "dev"
}
variable "aws_region" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}
