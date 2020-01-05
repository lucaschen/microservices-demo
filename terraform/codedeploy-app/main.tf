resource "aws_iam_role" "codedeploy-role" {
  name = "${var.app-name}-codedeploy-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "codedeploy.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "aws-codedeploy-role" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
  role       = aws_iam_role.codedeploy-role.name
}

resource "aws_codedeploy_app" "default" {
  compute_platform = "Server"
  name             = var.app-name
}

resource "aws_codedeploy_deployment_group" "dev" {
  app_name              = aws_codedeploy_app.default.name
  deployment_group_name = "dev"
  service_role_arn      = aws_iam_role.codedeploy-role.arn

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = var.ec2-instance-name
    }
  }
}
