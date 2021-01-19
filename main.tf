terraform {
  required_version = ">= 0.11.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ubuntu" {
  ami           = var.ami_id
  instance_type = var.instance_type
  availability_zone = var.az
  monitoring = true
}
