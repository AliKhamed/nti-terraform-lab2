variable "vpc-var" {
  type = map(any)
}

variable "subnet1" {
  type = map(any)
}

variable "igw-name" {
  type = string
}

variable "ec2" {
  type = map(any)
}
variable "cidr-rt" {
  type = string
}
variable "s3-bucket" {
  type = map(any)
}