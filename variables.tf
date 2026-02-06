variable "aws_region" {}
variable "vpc_cidr" {}
variable "public_subnet_cidrs" {
    type = list(string)
}
variable "private_subnet_cidrs" {
    type = list(string)
}
variable "instance_type" {}
variable "key_name" {}
variable "public_key_path" {}
variable "environment" {}
variable "my_ip" {}
