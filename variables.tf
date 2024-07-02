variable "env" {
  default = "dev"
}
variable "aws_region" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}
