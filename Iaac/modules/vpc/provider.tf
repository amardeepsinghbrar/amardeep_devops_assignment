# terraform {
#     backend "s3" {
#         bucket                      = var.s3_terraform_state_store_bucket
#         key                         = "${var.environment}/vpc/terraform.tfstate"
#         region                      = var.region
#         dynamodynamodb_table        = var.dynamodynamodb_table
#         profile                     = var.profile
#         }

#     required_providers {
#         aws = {
#             source  = "hashicorp/aws"
#             version = "~> 5.0"
#         }
#     }
#   }

# provider "aws" {
#   region = var.region
#   profile = var.profile
# }
