output "app-name" {
  value = aws_codedeploy_app.default.name
}

output "deployment-bucket-name" {
  value = aws_s3_bucket.deploy-bucket.id
}

output "iam-instance-profile" {
  value = aws_iam_instance_profile.ec2.name
}
