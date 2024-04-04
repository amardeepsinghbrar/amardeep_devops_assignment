terraform {
    backend "s3" {
        bucket                      = "mys3bucket-terraform"
        key                         = "pets/eksloadbalancer/terraform.tfstate"
        dynamodb_table              = "terraform-lock"
        region                      = "us-east-1"   
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
  region  = "us-east-1" 
  profile = "default"
}
provider "helm" {
  kubernetes {
    host                   = data.terraform_remote_state.eks_remote_state.outputs.cluster_endpoint
    token                  = data.aws_eks_cluster_auth.cluster.token
    cluster_ca_certificate = base64decode(data.terraform_remote_state.eks_remote_state.outputs.cluster_certificate_authority_data)
  }
}

 
