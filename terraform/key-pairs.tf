resource "aws_key_pair" "microservices-demo-key" {
  key_name   = "microservices-demo-key"
  public_key = file("./microservices_demo.pem")
}
