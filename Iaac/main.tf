
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
module "aws_key_pair" {
  source                           = "./modules/aws-key-pair"
  aws_ec2_keypair_name             = "pets"
}
module "jenkins_ec2" {
  source                           = "./modules/ec2"
  ec2_instance_name                = var.jenkins_ec2_instance_name
  vpc_id                           = module.my_vpc.vpc_id
  vpc_cidr_block                   = var.vpc_cidr
  aws_ec2_keypair_name             = module.aws_key_pair.aws_ec2_keypair
  ec2_security_group_name          = var.jenkins_ec2_security_group_name
  ec2_instance_type                = var.jenkins_ec2_instance_type
  subnet_id                        = module.my_vpc.public_subnet1
  associate_public_ip_address      = var.jenkins_ec2_associate_public_ip_address
  tags                             = var.tags 
}
# module "eks_cluster" {
#   source                            = "./modules/eks"
#   vpc_id                            = module.my_vpc.vpc_id
#   vpc_cidr_block                    = var.vpc_cidr
#   eks_cluster_name                  = var.eks_cluster_name
#   eks_cluster_version               = var.eks_cluster_version
#   cidr_private_subnet1_id           = module.my_vpc.private_subnet1
#   cidr_private_subnet2_id           = module.my_vpc.private_subnet2
#   tags                              = var.tags
#   iam_role_to_be_whitelisted        = module.ec2.ec2_iam_role

# }
# module "alb_controller" {
#   source                           = "./modules/aws-load-balancer-controller"
#   cluster_name                     = var.eks_cluster_name
#   cluster_identity_oidc_issuer     = data.aws_eks_cluster.cluster.identity.0.oidc.0.issuer
#   cluster_identity_oidc_issuer_arn = data.aws_iam_openid_connect_provider.oidc_provider.arn
#   aws_region                       = var.region
# }
