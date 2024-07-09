terraform {
  required_version = ">= 1.9.0"
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

module "web" {
  source     = "./modules/web"
  env        = var.env
  aws_region = var.aws_region
  subnet_ids = var.subnet_ids
  vpc_id     = var.vpc_id
}
