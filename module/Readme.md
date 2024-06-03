# Terraform AWS Infrastructure

This repository contains Terraform configurations to create a basic AWS infrastructure with a Virtual Private Cloud (VPC) and EC2 instances.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Important Variables](#important-variables)
- [Outputs](#outputs)

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) v1.0 or later
- [AWS CLI](https://aws.amazon.com/cli/)
- An AWS account with sufficient permissions to create the resources

## Setup

1. **Clone the repository:**

    ```sh
    git clone https://github.com/your-username/your-repo-name.git
    cd your-repo-name
    ```

2. **Configure AWS CLI:**

    Make sure your AWS CLI is configured with the necessary credentials. You can configure it by running:

    ```sh
    aws configure
    ```

3. **Initialize Terraform:**

    ```sh
    terraform init
    ```

## Usage

1. **Customize Variables:**

    Edit the `variables.tf` files in the root and module directories to customize the configuration as per your requirements.

2. **Plan the Infrastructure:**

    You can see what changes will be made by running:

    ```sh
    terraform plan
    ```

3. **Apply the Configuration:**

    Apply the changes to create the infrastructure:

    ```sh
    terraform apply --auto-approve
    ```

4. **Destroy the Infrastructure:**

    To clean up and destroy the created infrastructure, run:

    ```sh
    terraform destroy --auto-approve
    ```

## Project Structure

```plaintext
.
├── main.tf                  # Main Terraform configuration
├── output.tf                # Outputs definitions
├── module
│   ├── vpc
│   │   ├── main.tf          # VPC module configuration
│   │   ├── variables.tf     # VPC module variables
│   │   ├── output.tf        # VPC module outputs
│   └── ec2
│       ├── main.tf          # EC2 module configuration
│       ├── variables.tf     # EC2 module variables
│       ├── output.tf        # EC2 module outputs (if any)
└── README.md                # This file

## Important Variables

variable "this_vpc_cidr_block" {
  type = string
}

variable "this_vpc_tags" {
  type = string
}

variable "this_subnet_pub_cidr_block" {
  type = string
}

variable "this_subnet_pub_map_ip" {
  type = bool
}

variable "this_subnet_pub_tags" {
  type = string
}

variable "this_subnet_private1_cidr_block" {
  type = string
}

variable "this_subnet_private_map_ip" {
  type = bool
}

variable "this_subnet_private1_tags" {
  type = string
}

variable "this_subnet_private2_cidr_block" {
  type = string
}

variable "this_subnet_private2_tags" {
  type = string
}

variable "this_igw_tags" {
  type = string
}

variable "this_def_Route_example_cidr_block" {
  type = string
}

variable "this_def_Route_example_tag" {
  type = string
}

# Important Variables

## VPC Module
- this_vpc_cidr_block: CIDR block for the VPC.
- this_vpc_tags: Tags for the VPC.
- this_subnet_pub_cidr_block: CIDR block for the public subnet.
- this_subnet_pub_map_ip: Flag to map public IP on launch.
- this_subnet_pub_tags: Tags for the public subnet.
- this_subnet_private1_cidr_block: CIDR block for the first private subnet.
- this_subnet_private_map_ip: Flag to map public IP on launch for private subnets.
- this_subnet_private1_tags: Tags for the first private subnet.
- this_subnet_private2_cidr_block: CIDR block for the second private subnet.
- this_subnet_private2_tags: Tags for the second private subnet.
- this_igw_tags: Tags for the Internet Gateway.
- this_def_Route_example_cidr_block: CIDR block for the default route.
- this_def_Route_example_tag: Tags for the default route.

## EC2 Module
- this_aws_instance_ami: The AMI to use for the instance.
- this_aws_instance_instance_type: The instance type to use.
- this_aws_instance_key_name: The key name to use for the instance.
- this_aws_instance_sg_id: The security group ID to attach.
- this_aws_instance_availability_zone: The availability zone to launch the instance in.
- this_aws_instance_subnet: The subnet ID to launch the instance in.
- this_aws_instance_volume_size: The root volume size.
- this_aws_instance_count: Number of instances to launch.
- this_aws_instance_tags: Tags for the instance.

## Outputs

### VPC Module
- vpc_id: The ID of the created VPC.
- subnet_id: The ID of the created public subnet.
```
