terraform {
  backend "s3" {
      bucket                      = "mys3bucket-terraform"
      key                         = "pets/vpc/terraform.tfstate"
      dynamodb_table              = "terraform-lock"
      region                      = "us-east-1"
  }

  required_providers {
      aws = {
          source  = "hashicorp/aws"
          version = "~> 5.0"
      }
  }
  }

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}