output "vpc_id" {
  value = aws_vpc.myapp-vpc.id
}

output "subnet_id" {
  value = aws_subnet.myapp-subnet-1.id
}