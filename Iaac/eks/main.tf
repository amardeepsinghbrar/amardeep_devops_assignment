module "eks_cluster" {
  source                            = "./modules/eks"
  vpc_id                            = module.my_vpc.vpc_id
  vpc_cidr_block                    = var.vpc_cidr
  eks_cluster_name                  = var.eks_cluster_name
  eks_cluster_version               = var.eks_cluster_version
  cidr_private_subnet1_id           = module.my_vpc.private_subnet1
  cidr_private_subnet2_id           = module.my_vpc.private_subnet2
  tags                              = var.tags
  iam_role_to_be_whitelisted        = module.ec2.ec2_iam_role

}
module "alb_controller" {
  source                           = "./modules/aws-load-balancer-controller"
  cluster_name                     = var.eks_cluster_name
  cluster_identity_oidc_issuer     = data.aws_eks_cluster.cluster.identity.0.oidc.0.issuer
  cluster_identity_oidc_issuer_arn = data.aws_iam_openid_connect_provider.oidc_provider.arn
  aws_region                       = var.region
}
