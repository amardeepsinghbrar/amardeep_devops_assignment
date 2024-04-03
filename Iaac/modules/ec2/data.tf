data "aws_key_pair" "aws_ec2_keypair" {
  filter {
    name   = "key-name"
    values = [var.aws_ec2_keypair_name]
  }
}
data "aws_ami" "amazon_linux_ami" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
