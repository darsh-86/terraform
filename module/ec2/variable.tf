variable "this_aws_instance_ami" {
    type = string
}
variable "this_aws_instance_instance_type" {
    type = string
}
variable "this_aws_instance_key_name" {
    type = string
}
variable "this_aws_instance_sg_id" {
    type = string
}
variable "this_aws_instance_availability_zone" {
    type = string
}
variable "this_aws_instance_subnet" {
    type = string
}
variable "this_aws_instance_volume_size" {
    type = number
}
variable "this_aws_instance_count" {
    type = number
}
variable "this_aws_instance_tags" {
    type = map(string)
}
variable "this_sg_vpc_id" {
    type = string
}
variable ""