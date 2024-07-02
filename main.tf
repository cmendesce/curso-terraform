terraform {
  required_version = ">= 1.9.0"
  backend "s3" {
    bucket = "uece-terraform-backend"
    key    = "state.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "ubuntu" {
  ami           = var.ami_id
  instance_type = var.instance_type
  availability_zone = "us-east-1a"
  monitoring = true
  count = 1
  tags = {
    Environment = var.env
  }
}

