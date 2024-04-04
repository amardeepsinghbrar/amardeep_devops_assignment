resource "aws_security_group" "jenkins_ec2_security_group" {
    name        = var.ec2_security_group_name
    description = "SG for jenkins"
    vpc_id      =  var.vpc_id

    ingress  {
        description             = "HTTP port 8080 from Anywhere"
        from_port               = 8080
        to_port                 = 8080
        protocol                = "tcp"
        cidr_blocks             = ["0.0.0.0/0"]
    }
    egress  {
        description             =  "HTTPS"
        from_port               = 443
        to_port                 = 443
        protocol                = "tcp"
        cidr_blocks             = ["0.0.0.0/0"]
    }
    egress  {
        description             =  "HTTP"
        from_port               = 80
        to_port                 = 80
        protocol                = "tcp"
        cidr_blocks             = ["0.0.0.0/0"]
    }
}