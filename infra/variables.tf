# defining all variables

variable "aws_owner_id" {
  description = "Contains the Owner ID of the ami"
  type        = string
}

variable "aws_ami_name" {
  description = "Name of the ami I want for my project"
  type        = string
}

variable "vpc_name" {
  description = "Name of VPC which I want to use in the project"
  type        = string
}

variable "public_subnet_name" {
  description = "Name of a Subnet I want to put my ec2 in"
  type        = string
}

variable "ec2_type" {
  description = "Type of instance I want to use"
  type        = string
}

variable "public_keypair" {
  description = "Name of my keypair"
  type        = string
}