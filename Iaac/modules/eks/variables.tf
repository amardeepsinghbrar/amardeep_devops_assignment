variable "vpc_id" {
    type = string
    description = "vpc_id"
}
variable "vpc_cidr_block" {
    type = string
    description = "vpc_cidr_block"    
}
variable "eks_cluster_name" {
    type = string
    description = "eks_cluster_name"
}
variable "eks_cluster_version" {
    type = string
    description = "eks_cluster_version"
}
variable "cidr_private_subnet1_id" {
    type = string
    description = "cidr_private_subnet1_id"
}
variable "cidr_private_subnet2_id" {
    type = string
    description = "cidr_private_subnet2_id"
}
variable "tags" {
    type = map(string)
    description = "tags"
}
variable "iam_role_to_be_whitelisted" {
    type = string
    description = "iam_role_to_be_whitelisted"
}
