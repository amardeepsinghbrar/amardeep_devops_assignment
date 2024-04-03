# Creating key-pair on AWS using SSH-public key
resource "aws_key_pair" "aws_ec2_keypair" {
  key_name   = var.aws_ec2_keypair_name
  public_key = file("${path.module}/my-key.pub")
}