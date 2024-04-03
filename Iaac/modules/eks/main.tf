module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.eks_cluster_name
  cluster_version = var.eks_cluster_version

  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id                   = var.vpc_id
  subnet_ids               = [var.cidr_private_subnet1_id, var.cidr_private_subnet2_id]
  control_plane_subnet_ids = [var.cidr_private_subnet1_id, var.cidr_private_subnet2_id]

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = ["t2.micro","t3.medium"]
  }

  cluster_security_group_id = aws_security_group.eks_cluster_security_group.id
  node_security_group_id    = aws_security_group.eks_worker_security_group.id

  enable_irsa = true
  eks_managed_node_groups = {
    example = {
      min_size     = 1
      max_size     = 4
      desired_size = 1

      instance_types = ["t2.micro"]
      capacity_type  = "ON_DEMAND"

    }
  }

  # Cluster access entry
  # To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = true

  access_entries = {
    # One access entry with a policy associated
    example = {
      kubernetes_groups = []
      principal_arn     = var.iam_role_to_be_whitelisted

      policy_associations = {
        example = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
           # namespaces = ["*"]
            type       = "cluster"
          }
        }
      }
    }
  }
  cluster_tags = var.tags
}