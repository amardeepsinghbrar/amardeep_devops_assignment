variable "tags" {
    type = map(string)
    description = "tags"
}
variable "region" {
    type            = string
    description     = "Region"
}
variable "profile" {
    type = string
    description = "profile"
}
variable "environment" {
    type = string
    description = "environment"
}
variable "aws_ec2_keypair_name" {
     type = string
    description = "aws_ec2_keypair_name" 
}
#jenkins
variable "jenkins_ec2_instance_name"{
    type = string
    description = "jenkins_ec2_instance_name" 
}
variable "jenkins_ec2_security_group_name" {
    type = string
    description = "jenkins_ec2_security_group_name" 
}
variable "jenkins_ec2_instance_type" {
    type = string
    description = "jenkins_ec2_instance_type" 
}
variable "jenkins_ec2_associate_public_ip_address" {
    type = string
    description = "jenkins_ec2_associate_public_ip_address" 
}
variable "jenkins_root_volume" {
    type = string
    description = "jenkins_root_volume"
}