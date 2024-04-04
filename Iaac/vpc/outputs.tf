output "vpc_id" {
    value =  module.my_vpc.vpc_id
}
output "vpc_name" {
    value =  module.my_vpc.tags["Name"]
}
output "vpc_cidr" {
    value =  module.my_vpc.vpc_cidr
}
output "public_subnet1" {
    value =  module.my_vpc.public_subnet1
}
output "public_subnet2" {
    value =  module.my_vpc.public_subnet2
}
output "private_subnet1" {
    value =  module.my_vpc.private_subnet1
}
output "private_subnet2" {
    value =  module.my_vpc.private_subnet2
}