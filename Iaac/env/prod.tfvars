# ----------------------Common-----------------------
  profile = "default"
  dynamodynamodb_table = "terraform-lock"
  s3_terraform_state_store_bucket = "mys3bucket-terraform"
  environment = "prod"

# ----------------------VPC-----------------------
vpc_name                            = "amardeep_vpc"
vpc_cidr                            = "172.20.0.0/16"
az1                                 = "us-east-1a"
az2                                 = "us-east-1b"
cidr_public_subnet1                 = "172.20.10.0/24"
cidr_public_subnet2                 = "172.20.11.0/24"
cidr_private_subnet1                = "172.20.20.0/24"
cidr_private_subnet2                = "172.20.21.0/24"
tags                                = {
                                        environment = "prod"
                                        techteam    = "devops"
                                        managedby   = "terraform"
                                      }


# ----------------------EKS-----------------------
eks_cluster_name                    = "prod-eks"
eks_cluster_version                 = "1.29"

# ----------------------jenkins-----------------------
jenkins_ec2_instance_name               = "prod_jenkins"
jenkins_ec2_security_group_name         = "prod_jenkins_sg"
jenkins_ec2_instance_type               = "t2.micro"
jenkins_ec2_associate_public_ip_address = true
jenkins_root_volume                     = 8