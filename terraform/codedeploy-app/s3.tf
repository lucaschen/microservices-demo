resource "aws_s3_bucket" "deploy-bucket" {
  bucket = "microservices-demo-${var.app-name}-deployment"
}
