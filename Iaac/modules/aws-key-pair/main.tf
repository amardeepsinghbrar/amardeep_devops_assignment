# Creating key-pair on AWS using SSH-public key

resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "aws_ec2_keypair" {
  key_name   = var.aws_ec2_keypair_name
  public_key = tls_private_key.example.public_key_openssh
}