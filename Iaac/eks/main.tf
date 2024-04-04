module "eks_cluster" {
  source                            = "../modules/eks"
  vpc_id                            = data.terraform_remote_state.vpc_remote_state.outputs.vpc_id
  vpc_cidr_block                    = data.terraform_remote_state.vpc_remote_state.outputs.vpc_cidr
  eks_cluster_name                  = var.eks_cluster_name
  eks_cluster_version               = var.eks_cluster_version
  cidr_private_subnet1_id           = data.terraform_remote_state.vpc_remote_state.outputs.private_subnet1
  cidr_private_subnet2_id           = data.terraform_remote_state.vpc_remote_state.outputs.private_subnet2
  iam_role_to_be_whitelisted        = data.terraform_remote_state.jenkins_remote_state.outputs.ec2_iam_role
  tags                              = var.tags
}
