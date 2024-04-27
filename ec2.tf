
resource "aws_instance" "ec2" {
  ami                         = var.ec2["ami"]
  instance_type               = var.ec2["type"]
  subnet_id                   = aws_subnet.public-subnet1.id
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true
  tags = {
    Name = var.ec2["tag-name"]
  }
}