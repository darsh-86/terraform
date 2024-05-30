provider "aws" {
  region = "eu-west-3"
}

resource "aws_vpc" "my_tf_vpc" {
  cidr_block = "10.0.0.0/20"
  tags = {
    Name = "my_tf_vpc"
    }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.my_tf_vpc.id
  cidr_block        = "10.0.1.0/24" 
  availability_zone = "eu-west-3a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_security_group" "tf_secure" {
  name        = "tf_secure"
  description = "Allow SSH for all network"
  vpc_id      = aws_vpc.my_tf_vpc.id

  ingress {
    description      = "SSH rule"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description     = "HTTP Rule"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] 
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tf_secure"
  }
}

data "aws_ami" "my_ami" {
  most_recent = true
  owners      = ["099720109477"] # Canonical (Ubuntu) account ID

  filter {
    name   = "name"
    values = ["ubuntu-pro-server/images/hvm-ssd-gp3/ubuntu-noble-24.04-arm64-pro-server-20240423"]
  }
}


resource "aws_instance" "instance1" {
  ami                    = data.aws_ami.my_ami.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet.id         
  vpc_security_group_ids = [aws_security_group.tf_secure.id]
  key_name               = "parisIAM"
  associate_public_ip_address = true


  tags = {
    Name = "allow_tls"
    Env  = "Dev"
  }
}

resource "aws_eip" "elastic_ip" {
  instance = aws_instance.instance1.id
  vpc      = true
}


variable "instance_type" {
  type    = string
  default = "t4g.micro" # Changed to an arm64 compatible instance type
}

output "hello_world" {
  value = "hello world" # Correct spelling
}

output "public_ip" {
  value = aws_instance.instance1.public_ip
}

output "elastic_ip" {
  value = aws_eip.elastic_ip.public_ip
}