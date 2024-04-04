terraform {
    backend "s3" {
        bucket                      = "mys3bucket-terraform"
        key                         = "${var.environment}/jenkins/terraform.tfstate"
        dynamodb_table              = "terraform-lock"
        region                      = var.region
        }

    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
  }

provider "aws" {
  region  = var.region
  profile = "default"
}