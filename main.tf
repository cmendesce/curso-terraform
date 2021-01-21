terraform {
  required_version = ">= 0.11.0"
  backend "s3" {
    bucket = "uece-terraform-backend"
    key    = "state.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "ubuntu" {
  ami           = var.ami_id
  instance_type = var.instance_type
  availability_zone = var.availability_zone_names
  monitoring = true
  count = 2

  tags = {
    Environment = var.env
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = "um-bucket-privado-uece"
  acl    = "private"

  tags = {
    Environment = var.env
  }
}
