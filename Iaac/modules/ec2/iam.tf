locals {
  account_id = data.aws_caller_identity.current.account_id
}
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "jenkins_ec2_iam_role" {
  name               = "jenkins_ec2_iam_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "jenkins_ec2_iam_policy_document" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "ec2:CreateNetworkInterface",
      "ec2:DescribeDhcpOptions",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DeleteNetworkInterface",
      "ec2:DescribeSubnets",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeVpcs",
    ]

    resources = ["*"]
  }
  
  statement {
    effect = "Allow"

    actions = [
        "eks:DescribeCluster",
    ]

    resources = ["*"]
  }
  statement {
    effect = "Allow"

    actions = [
        "ecr:BatchCheckLayerAvailability",
        "ecr:CompleteLayerUpload",
        "ecr:GetAuthorizationToken",
        "ecr:InitiateLayerUpload",
        "ecr:PutImage",
        "ecr:UploadLayerPart"
    ]

    resources = ["*"]
  }
}
resource "aws_iam_role_policy" "code_pipeline_service_policy" {
  role   = aws_iam_role.jenkins_ec2_iam_role.name
  policy = data.aws_iam_policy_document.jenkins_ec2_iam_policy_document.json
}