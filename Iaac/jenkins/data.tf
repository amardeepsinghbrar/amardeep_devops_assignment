data "terraform_remote_state" "remote_network"{
  backend = "s3"
  config = {
      bucket                      = "mys3bucket-terraform"
      key                         = "${var.environment}/vpc/terraform.tfstate"
      region                      = var.region 
      profile                     = var.profile 
  }
}