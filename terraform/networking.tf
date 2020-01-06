resource "aws_db_subnet_group" "private" {
  name       = "microservices-demo-db-subnet-group-private"
  subnet_ids = [aws_subnet.microservices-demo-subnet-private-1.id, aws_subnet.microservices-demo-subnet-private-2.id]

  tags = {
    Name = "Private DB Subnet Group"
  }
}

resource "aws_internet_gateway" "microservices-demo" {
  vpc_id = aws_vpc.microservices-demo.id
}

resource "aws_route_table" "allow-outgoing-access" {
  vpc_id = aws_vpc.microservices-demo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.microservices-demo.id
  }

  tags = {
    Name = "Route Table Allowing Outgoing Access"
  }
}

resource "aws_route_table_association" "microservices-demo-subnet-public" {
  subnet_id      = aws_subnet.microservices-demo-subnet-public.id
  route_table_id = aws_route_table.allow-outgoing-access.id
}

resource "aws_route_table_association" "microservices-demo-subnet-private-1" {
  subnet_id      = aws_subnet.microservices-demo-subnet-private-1.id
  route_table_id = aws_route_table.allow-outgoing-access.id
}

resource "aws_security_group" "allow-internal-http" {
  name        = "allow-internal-http"
  description = "Allow internal HTTP requests"
  vpc_id      = aws_vpc.microservices-demo.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.microservices-demo.cidr_block]
  }
}

resource "aws_security_group" "allow-internal-mysql" {
  name        = "allow-internal-mysql"
  description = "Allow internal MySQL requests"
  vpc_id      = aws_vpc.microservices-demo.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.microservices-demo.cidr_block]
  }
}

resource "aws_security_group" "allow-http" {
  name        = "allow-http"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.microservices-demo.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow-ssh" {
  name        = "allow-ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.microservices-demo.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow-all-outbound" {
  name        = "allow-all-outbound"
  description = "Allow all outbound traffic"
  vpc_id      = aws_vpc.microservices-demo.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_subnet" "microservices-demo-subnet-public" {
  availability_zone_id = "apse2-az1"
  cidr_block           = "10.0.0.0/24"
  vpc_id               = aws_vpc.microservices-demo.id

  tags = {
    Name = "Microservices Demo Subnet (Public)"
  }
}

resource "aws_subnet" "microservices-demo-subnet-private-1" {
  availability_zone_id = "apse2-az1"
  cidr_block           = "10.0.1.0/24"
  vpc_id               = aws_vpc.microservices-demo.id

  tags = {
    Name = "Microservices Demo Subnet (Private 1)"
  }
}

resource "aws_subnet" "microservices-demo-subnet-private-2" {
  availability_zone_id = "apse2-az2"
  cidr_block           = "10.0.2.0/24"
  vpc_id               = aws_vpc.microservices-demo.id

  tags = {
    Name = "Microservices Demo Subnet (Private 2)"
  }
}

resource "aws_vpc" "microservices-demo" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "Microservices Demo VPC"
  }
}
