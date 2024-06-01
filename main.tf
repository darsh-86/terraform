provider "aws" {
  region = "eu-west-3"
}

module "vpc" {
    source = "./module/vpc"
    this_vpc_cidr_block = "12.11.0.0/16"
    this_vpc_tags = "this_vpc"
    this_subnet_pub_cidr_block = "12.11.0.0/17"
    this_subnet_private1_cidr_block = "12.11.128.0/19"
    this_subnet_pub_map_ip = true
    this_subnet_private_map_ip = false
    this_subnet_pub_tags = "pub_subnet"
    this_subnet_private1_tags = "pri_subnet1"
    this_subnet_private2_cidr_block = "12.11.192.0/20"
    this_subnet_private2_tags = "pri_subnet2"
    this_igw_tags = "igw"
    this_def_Route_example_cidr_block = "0.0.0.0/0"
    this_def_Route_example_tag = "default" 
} 

resource "aws_security_group" "this_sg" {
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "this_sg"
  }
}

module "ec2" {
    source = "./module/ec2"
    this_aws_instance_ami = "ami-0eb5115914ccc4bc2"
    this_aws_instance_instance_type = "t2.micro"
    this_aws_instance_key_name = "delete_oregon_anup"
    this_aws_instance_availability_zone = "us-west-2b"
    this_aws_instance_volume_size = 15
    this_aws_instance_count = 2
    this_aws_instance_user_data_base64 = true
    this_aws_instance_tags = "Terraform_instance"
    this_aws_instance_subnet = module.vpc.subnet_id
    this_sg_vpc_id = module.vpc.vpc_id
    this_aws_instance_sg_id = aws_security_group.this_sg.id
}
