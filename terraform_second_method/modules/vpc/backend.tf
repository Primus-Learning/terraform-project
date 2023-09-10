terraform {
  backend "s3" {
    bucket               = "primuslearning-terraform"
    region               = "us-east-1"
    workspace_key_prefix = "terraform/env"
    key                  = "vpc/terraform.tfstate"
  }
}