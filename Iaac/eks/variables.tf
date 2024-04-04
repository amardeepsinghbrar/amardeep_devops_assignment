variable "eks_cluster_name" {
    type = string
    description = "eks_cluster_name"
}
variable "eks_cluster_version" {
    type = string
    description = "eks_cluster_version"
}
variable "tags" {
    type = map(string)
    description = "tags"
}
variable "region" {
    type            = string
    description     = "Region"
}
variable "profile" {
    type            = string
    description     = "profile"
}


