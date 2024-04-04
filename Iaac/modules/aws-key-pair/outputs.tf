output "aws_ec2_keypair" {
    value =  aws_key_pair.aws_ec2_keypair.id
}
output "private_key" {
  value     = tls_private_key.example.private_key_pem
  sensitive = true
}
output "public_key" {
  value     = tls_private_key.example.public_key_pem
}