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
variable "region" {
    type = string
    description = "region"
}
variable "profile" {
    type = string
    description = "profile"
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
