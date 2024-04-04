module "alb_controller" {
  source                           = "../modules/aws-load-balancer-controller"
  cluster_name                     = var.eks_cluster_name
  cluster_identity_oidc_issuer     = data.aws_eks_cluster.cluster.identity.0.oidc.0.issuer
  cluster_identity_oidc_issuer_arn = data.aws_iam_openid_connect_provider.oidc_provider.arn
  aws_region                       = var.region
}
