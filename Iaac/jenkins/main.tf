module "aws_key_pair" {
  source                           = "./modules/aws-key-pair"
  aws_ec2_keypair_name             = var.aws_ec2_keypair_name
}
module "jenkins_ec2" {
  source                           = "./modules/ec2"
  ec2_instance_name                = var.jenkins_ec2_instance_name
  vpc_id                           = module.my_vpc.vpc_id
  vpc_cidr_block                   = data.terraform_remote_state.remote_network.vpc_cidr
  aws_ec2_keypair_name             = module.aws_key_pair.aws_ec2_keypair
  ec2_security_group_name          = var.jenkins_ec2_security_group_name
  ec2_instance_type                = var.jenkins_ec2_instance_type
  subnet_id                        = module.my_vpc.public_subnet1
  associate_public_ip_address      = var.jenkins_ec2_associate_public_ip_address
  jenkins_root_volume              = var.jenkins_root_volume
  tags                             = var.tags 
}