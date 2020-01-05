output "instance-id" {
  value = aws_instance.default.id
}

output "name" {
  value = var.name
}

output "private-ip" {
  value = aws_instance.default.private_ip
}
