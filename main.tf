terraform {
  required_version = ">= 0.11.0"
  backend "s3" {
    bucket = "uece-terraform-backend"
    key    = "state.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ubuntu" {
  ami           = var.ami_id
  instance_type = var.instance_type
  availability_zone = var.az
  monitoring = true
  count = 2

  tags = {
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = "um-bucket-privado-uece"
  acl    = "private"

  tags = {
    Environment = "Dev"
  }
}
