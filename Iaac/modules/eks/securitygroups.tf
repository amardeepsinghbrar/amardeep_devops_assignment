resource "aws_security_group" "eks_cluster_security_group" {
    name        = "eks-cluster-security-group"
    description = "SG for eks"
    vpc_id      =  var.vpc_id

    ingress  {
        description             = "HTTP port 80 from VPC"
        from_port               = 80
        to_port                 = 80
        protocol                = "tcp"
        cidr_blocks             = [var.vpc_cidr_block]
    }
    ingress  {
        description             = "HTTP port 443 from VPC"
        from_port               = 443
        to_port                 = 443
        protocol                = "tcp"
        cidr_blocks             = [var.vpc_cidr_block]
    }
    egress  {
        description             =  "EKS UDP 53 port to cluster sg"
        from_port               = 53
        to_port                 = 53
        protocol                = "udp"
        self                    = true
    }
    egress  {
        description             =  "EKS TCP 53 port to cluster sg"
        from_port               = 53
        to_port                 = 53
        protocol                = "tcp"
        self                    = true
    }
    egress  {
        description             =  "Port 10250 to cluster sg"
        from_port               = 10250
        to_port                 = 10250
        protocol                = "tcp"
        self                    = true
    }
    egress  {
        description             = "Port 443 to cluster sg"
        from_port               = 443
        to_port                 = 443
        protocol                = "tcp"
        self                    = true
    }
}
resource "aws_security_group" "eks_worker_security_group" {
    name        = "eks-worker-security-group"
    description = "SG for eks worker"
    vpc_id      =  var.vpc_id

    egress  {
        description             = "HTTP port 80 to outside world"
        from_port               = 80
        to_port                 = 80
        protocol                = "tcp"
        cidr_blocks             = ["0.0.0.0/0"]
    }
    egress  {
        description             = "HTTP port 443 to outside world"
        from_port               = 443
        to_port                 = 443
        protocol                = "tcp"
        cidr_blocks             = ["0.0.0.0/0"]
    }
}