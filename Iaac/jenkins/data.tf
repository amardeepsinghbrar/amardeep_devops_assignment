data "terraform_remote_state" "remote_network"{
  backend = "s3"
  config = {
      bucket                      = "mys3bucket-terraform"
      key                         = "pets/vpc/terraform.tfstate"
      region                      = var.region 
      profile                     = var.profile 
  }
}