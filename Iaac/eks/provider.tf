terraform {
    backend "s3" {
        bucket                      = "mys3bucket-terraform"
        key                         = "${var.environment}/eks/terraform.tfstate"
        dynamodb_table              = "terraform-lock"
        region = "us-east-1"   
        }

    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
        helm = {
          source  = "hashicorp/helm"
          version = ">= 2.7"
        }
        kubectl = {
          source  = "alekc/kubectl"
          version = ">= 2.0"
        }
    }
  }

provider "aws" {
  region  = var.region
  profile = "default"
}
provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    token                  = data.aws_eks_cluster_auth.cluster.token
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  }
}