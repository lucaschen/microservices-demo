variable "apply-immediately" {
  type    = bool
  default = false
}

variable "db-name" {
  type = string
}

variable "db-subnet-group-name" {
  type = string
}

variable "engine-version" {
  type    = string
  default = "5.7"
}

variable "identifier" {
  type = string
}

variable "instance-class" {
  type    = string
  default = "db.t2.micro"
}

variable "parameter-group-name" {
  type    = string
  default = "default.mysql5.7"
}

variable "password" {
  type = string
}

variable "publicly-accessible" {
  type = bool
}

variable "username" {
  type = string
}

variable "vpc-security-group-ids" {
  type    = list(string)
  default = []
}
