resource "aws_iam_instance_profile" "ec2" {
  name = "${var.app-name}-ec2"
  role = aws_iam_role.ec2.name
}
