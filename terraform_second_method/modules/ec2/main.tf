data "aws_subnet" "subnet" {
  filter {
    name   = "tag:Name"
    values = ["${var.env_prefix}-subnet-1"]
  }
}

data "aws_security_group" "default" {
  tags = {
    Name = "${var.env_prefix}-default-sg"
  }
}

data "aws_ami" "latest-amazon-linux-image" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "myapp-server" {
  ami                         = data.aws_ami.latest-amazon-linux-image.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = data.aws_subnet.subnet.id
  vpc_security_group_ids      = [data.aws_security_group.default.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  tags = {
    Name = "${var.env_prefix}-server"
  }
}