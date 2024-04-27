output "ec2-public-ipv4" {
  value = aws_instance.ec2.public_ip
}

output "ec2-state" {
  value = aws_instance.ec2.instance_state
}