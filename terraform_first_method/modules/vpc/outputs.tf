output "vpc" {
  value = aws_vpc.myapp-vpc
}

output "subnet" {
  value = aws_subnet.myapp-subnet-1
}