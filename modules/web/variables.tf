variable "env" {
  default = "dev"
}

variable "instance_types" {
  default = {
    default = "t2.small",
    dev = "t2.small",
    prod = "t2.large"
  }
}

variable "aws_region" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}
