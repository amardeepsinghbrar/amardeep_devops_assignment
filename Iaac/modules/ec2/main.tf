resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.jenkins_ec2_iam_role.name
}

# Creating  EC2 instance
resource "aws_instance" "ec2-instance" {
  ami             = data.aws_ami.amazon_linux_ami.id
  instance_type   = var.ec2_instance_type
  key_name        = data.aws_key_pair.aws_ec2_keypair.key_name
  vpc_security_group_ids = [aws_security_group.jenkins_ec2_security_group.id]
  tags = merge(
    var.tags,
    {
      Name = var.ec2_instance_name
    }
  )
  subnet_id = var.subnet_id
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.id
  associate_public_ip_address = var.associate_public_ip_address

  root_block_device {
    volume_size = var.jenkins_root_volume
  }

  user_data = <<EOF
#!/bin/bash

# Update the package lists
echo "===Update the package lists==="
yum update -y

#installing git (Precondition for jenkins docker commands)
echo "===installing git==="
yum install git -y

#uninstalling existing old aws cli. Else this will lead to  client.authentication.k8s.io/v1alpha1 error.
echo "===uninstalling aws==="
sudo yum remove awscli

#installing aws cli
echo "===installing aws==="
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Installing kubectl for kubernetes 1.29
echo "===installing kubectl==="
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.29.0/2024-01-04/bin/linux/amd64/kubectl
chmod +x ./kubectl
cp ./kubectl /usr/local/bin


# Installing Docker
echo "===installing docker==="
amazon-linux-extras install docker -y
systemctl enable docker
systemctl start docker

# Add the ec2-user to the docker group
usermod -a -G docker ec2-user


# Installing Helm
echo "===installing Helm==="
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# installing java-17-amazon-corretto
echo "===installing java17==="
yum  install java-17-amazon-corretto -y

# installing jenkins
echo "===installing jenkins==="
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum install jenkins -y
systemctl enable jenkins
systemctl start jenkins

#Adding Jenkins in docker group
echo "===Adding Jenkins in docker group==="
usermod -aG docker jenkins

EOF
}