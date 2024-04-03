output "ec2_iam_role" {
  description = "ec2_iam_role"
  value       = aws_iam_role.jenkins_ec2_iam_role.arn
}
output "aws_instance_public_ip" {
  description = "Public IP of EC2"
  value       = aws_instance.ec2-instance.public_ip
}