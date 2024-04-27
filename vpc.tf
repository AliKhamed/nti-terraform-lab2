resource "aws_vpc" "nti-vpc1" {
  cidr_block = var.vpc-var["cidr"]
  tags = {
    Name = var.vpc-var["name"]
  }
}