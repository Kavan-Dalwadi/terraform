variable "env" {
    description = "Project environment"
    type = string
}

variable "vpc_id" {
    description = "VPC id"
    type = string
}

variable "vpc_subnet_id" {
    type = string
    description = "VPC subnet  id"
}

variable "aws_instance_web_id" {
    type = string
    description = "AWS EC2 Web  Id"
}
