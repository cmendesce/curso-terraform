variable "aws_region" {
  description = "AWS default region"
  default = "us-east-1"
}

variable "az" {
  description = "Availability zone"
  default = "us-east-1a"
}

variable "ami_id" {
  description = ""
  default = "ami-0be2609ba883822ec"
}

variable "instance_type" {
  description = "type of EC2 instance to provision."
  default = "t2.micro"
}
