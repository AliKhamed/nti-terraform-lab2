resource "aws_route_table" "nti-rt" {
  vpc_id = aws_vpc.nti-vpc1.id

  route {
    cidr_block = var.cidr-rt
    gateway_id = aws_internet_gateway.gw.id
  }
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.nti-rt.id
}