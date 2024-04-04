terraform {
  required_providers {
      aws = {
          source  = "hashicorp/aws"
          version = "~> 5.0"
      }
  }
}

terraform {
  backend "s3" {
      bucket                      = "mys3bucket-terraform"
      key                         = "${var.environment}/vpc/terraform.tfstate"
      dynamodb_table              = "terraform-lock"
      region                      = var.region
  }
  }

provider "aws" {
  region  = var.region
  profile = "default"
}