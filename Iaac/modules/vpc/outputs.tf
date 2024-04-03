output "vpc_id" {
    value =  aws_vpc.my_vpc.id
}
output "vpc_name" {
    value =  aws_vpc.my_vpc.tags["Name"]
}
output "public_subnet1" {
    value =  aws_subnet.public_subnet1.id
}
output "public_subnet2" {
    value =  aws_subnet.public_subnet2.id
}
output "private_subnet1" {
    value =  aws_subnet.private_subnet1.id
}
output "private_subnet2" {
    value =  aws_subnet.private_subnet2.id
}
