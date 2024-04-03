variable "vpc_id" {
    type = string
    description = "vpc_id"
}
variable "ec2_instance_name" {
    type = string
    description = "ec2_instance_name"
}
variable "vpc_cidr_block" {
    type = string
    description = "vpc_cidr_block"    
}
variable "aws_ec2_keypair_name" {
    type = string
    description = "EC2 key name"
}
variable "ec2_security_group_name" {
    type = string
    description = "ec2_security_group_name"
}
variable "ec2_instance_type" {
    type = string
    description = "ec2_instance_type"
}
variable "tags" {
    type = map(string)
    description = "tags"
}
variable "subnet_id" {
    type = string
    description = "subnet_id"
}
variable "associate_public_ip_address" {
    type = string
    description = "associate_public_ip_address"
}