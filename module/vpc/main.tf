resource "aws_vpc" "this_vpc" {
  cidr_block = var.this_vpc_cidr_block
  tags = {
    Name = var.this_vpc_tags
  }
}

resource "aws_subnet" "this_subnet_pub" {
  vpc_id                  = aws_vpc.this_vpc.id  
  availability_zone       = "eu-west-3a"
  cidr_block              = var.this_subnet_pub_cidr_block
  map_public_ip_on_launch = var.this_subnet_pub_map_ip
  tags = {
    Name = var.this_subnet_pub_tags
  }
}

resource "aws_subnet" "this_subnet_private1" {
  vpc_id                  = aws_vpc.this_vpc.id
  availability_zone       = "eu-west-3a"
  cidr_block              = var.this_subnet_private1_cidr_block
  map_public_ip_on_launch = var.this_subnet_private_map_ip
  tags = {
    Name = var.this_subnet_private1_tags
  }
}

resource "aws_subnet" "this_subnet_private2" {
  vpc_id                  = aws_vpc.this_vpc.id
  availability_zone       = "eu-west-3b"
  cidr_block              = var.this_subnet_private2_cidr_block
  map_public_ip_on_launch = var.this_subnet_private_map_ip
  tags = {
    Name = var.this_subnet_private2_tags
  }
}

resource "aws_internet_gateway" "this_igw" {
  vpc_id = aws_vpc.this_vpc.id
  tags = {
    Name = var.this_igw_tags
  }
}

resource "aws_route_table" "this_route_table" {
  vpc_id = aws_vpc.this_vpc.id

  route {
    cidr_block = var.this_def_Route_example_cidr_block
    gateway_id = aws_internet_gateway.this_igw.id
  }

  tags = {
    Name = var.this_def_Route_example_tag
  }
}

resource "aws_route_table_association" "this_rw_association" {
  subnet_id      = aws_subnet.this_subnet_pub.id
  route_table_id = aws_route_table.this_route_table.id
}
