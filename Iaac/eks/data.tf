data "terraform_remote_state" "jenkins_remote_state"{
  backend = "s3"
  config = {
      bucket                      = "mys3bucket-terraform"
      key                         = "pets/jenkins/terraform.tfstate"
      region                      = var.region 
      profile                     = var.profile 
  }
}
data "terraform_remote_state" "vpc_remote_state"{
  backend = "s3"
  config = {
      bucket                      = "mys3bucket-terraform"
      key                         = "pets/vpc/terraform.tfstate"
      region                      = var.region 
      profile                     = var.profile 
  }
}