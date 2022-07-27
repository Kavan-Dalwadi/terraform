variable "env" {
    description = "Project environment"
    type = string
}

variable "key_name" {
    type = string
    description = "ec2 key name"
}

variable "instance_type" {
  description = "AWS EC2 instance type"
  type = string
}

variable "public_key_path" {
    type = string
    description = "ec2 public key path"
}

variable "ami" {
    type = string
    description = "ec2 ami"
}

variable "vpc_security_group_id" {
    type = string
    description = "vpc deafault security group id"
}

variable "vpc_subnet_id" {
    type = string
    description = "vpc subnet  id"
}