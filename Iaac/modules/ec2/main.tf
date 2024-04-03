resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.jenkins_ec2_iam_role.name
}

# Creating  EC2 instance
resource "aws_instance" "ec2-instance" {
  ami             = data.aws_ami.amazon_linux_ami.id
  instance_type   = var.ec2_instance_type
  key_name        = aws_key_pair.aws_ec2_keypair.key_name
  vpc_security_group_ids = [aws_security_group.network-security-group.id]
  tags = merge(
    var.tags,
    {
      Name = var.ec2_instance_name
    }
  )
  subnet_id = var.subnet_id
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.id
  associate_public_ip_address = var.associate_public_ip_address

  user_data = <<EOF
#!/bin/bash

# Update the package lists
yum update -y

# Install Jenkins
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
yum install jenkins -y
service jenkins start

# Install Docker
amazon-linux-extras install docker -y
service docker start

# Add the ec2-user to the docker group
usermod -a -G docker ec2-user

# Install kubectl
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.29.0/2024-01-04/bin/darwin/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH


# Install Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh


EOF
}