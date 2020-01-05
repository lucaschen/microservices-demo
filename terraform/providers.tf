provider "aws" {
  access_key = var.aws-access-key
  secret_key = var.aws-secret-key
  region     = var.aws-region

  version = "~> 2.0"
}
