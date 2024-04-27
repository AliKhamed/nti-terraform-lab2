resource "aws_subnet" "public-subnet1" {
  vpc_id     = aws_vpc.nti-vpc1.id
  cidr_block = var.subnet1["cidr"]

  tags = {
    Name = var.subnet1["name"]
  }
}