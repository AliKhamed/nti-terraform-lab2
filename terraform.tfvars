vpc-var = {
  name = "nti-vpc1"
  cidr = "10.0.0.0/16"
}

subnet1 = {
  cidr = "10.0.0.0/24"
  name = "nti-subnet1"
}

igw-name = "nti-igw"

ec2 = {
  ami      = "ami-04b70fa74e45c3917"
  type     = "t2.micro"
  tag-name = "nti ec2"
}

cidr-rt = "0.0.0.0/0"

s3-bucket = {
  bucket-name = "alikhames566-s3-bucket-terraform-fstat"
  s3-tag-name = "nti s3 bucket"
} 