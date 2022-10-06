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
variable "db_storage" {
  description = "Size of the disk for db"
}

variable "db_name" {
  description = "Name of the database"
}

variable "db_engine" {
  description = "the db engine to run rds"
}

variable "db_engine_version" {
  description = "version of db engine"
}

variable "db_instance_class" {
  description = "instance type"
}

variable "db_username" {
  description = "username to connect to the db"
}

variable "db_skip_last_snapshot" {
  description = "skip taking a snapshot before destroying the db"
  default     = true
}