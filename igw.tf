resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.nti-vpc1.id

  tags = {
    Name = var.igw-name
  }
}