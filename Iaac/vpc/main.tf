
module "my_vpc" {
  # Creating VPC with 2 public and 2 private subnets. 
  source                             = "./modules/vpc"
  vpc_name                           = var.vpc_name
  vpc_cidr                           = var.vpc_cidr
  az1                                = var.az1
  az2                                = var.az2
  cidr_public_subnet1                = var.cidr_public_subnet1
  cidr_public_subnet2                = var.cidr_public_subnet2
  cidr_private_subnet1               = var.cidr_private_subnet1
  cidr_private_subnet2               = var.cidr_private_subnet2
  tags                               = var.tags

  profile                            = var.profile
  dynamodynamodb_table               = var.dynamodynamodb_table
  s3_terraform_state_store_bucket    = var.s3_terraform_state_store_bucket
  environment                        = var.environment
  region                             = var.region
}