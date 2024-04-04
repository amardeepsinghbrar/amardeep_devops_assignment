output "ec2_iam_role" {
  description = "ec2_iam_role"
  value       = module.jenkins_ec2.ec2_iam_role
}
output "aws_instance_public_ip" {
  description = "Public IP of EC2"
  value       = module.jenkins_ec2.aws_instance_public_ip
}
output "private_key" {
  value     = module.aws_key_pair.private_key
  sensitive = true
}