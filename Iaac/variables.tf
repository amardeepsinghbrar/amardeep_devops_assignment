variable "vpc_name" {
    type = string
    description = "VPC Name"
}
variable "vpc_cidr" {
    type = string
    description = "CIDR block for VPC"
}
variable "az1" {
    type = string
    description = "AZ1 name"
}
variable "az2" {
    type = string
    description = "AZ2 name"
}
variable "cidr_public_subnet1" {
    type = string
    description = "cidr_public_subnet1"
}
variable "cidr_public_subnet2" {
    type = string
    description = "cidr_public_subnet2"
}
variable "cidr_private_subnet1" {
    type = string
    description = "cidr_private_subnet1"
}
variable "cidr_private_subnet2" {
    type = string
    description = "cidr_private_subnet2"
}
variable "tags" {
    type = map(string)
    description = "tags"
}
variable "ecr_name" {
    type = string
    description = "Name of ECR"
}
variable "ecr_tag_mutability_setting" {
    type = string
    description = "The tag mutability setting for the repository"
}
variable "ecr_scan_on_push" {
    type = bool
    default = false
    description = "The tag mutability setting for the repository"
}
variable "region" {
    type            = string
    description     = "Region"
}
variable "profile" {
    type            = string
    description     = "profile"
}
variable "git_platform" {
    type            = string
    default         = "GITHUB"
    description     = "git_platform"
}
variable "git_repo_url" {
    type            = string
    description     = "git url"
}
variable "build_project_name" {
    type            = string
    description     = "build_project_name"
}
variable "build_project_description" {
    type            = string
    description     = "build_project_description"
}
variable "dynamodynamodb_table" {
    type = string
    description = "dynamodynamodb_table"
}
variable "s3_terraform_state_store_bucket" {
    type = string
    description = "s3_terraform_state_store_bucket"
}
variable "environment" {
    type = string
    description = "environment"
}
variable "eks_cluster_name" {
    type = string
    description = "eks_cluster_name"
}
variable "eks_cluster_version" {
    type = string
    description = "eks_cluster_version"
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