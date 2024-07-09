terraform {
  backend "s3" {
    bucket = "uece-terraform-backend"
    key    = "state.tfstate"
    region = "us-east-1"
  }
}
