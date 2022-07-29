
variable "env" {
    description = "Project environment"
    type = string
}

variable "allocated_storage" {
  description = "Storage size in GB"
}

variable "engine" {
  description = "Engine type, example values mysql, postgres"
}

variable "engine_version" {
  description = "Engine version"
}

variable "instance_class" {
  description = "Instance class"
}


variable "username" {
  description = "User name"
}

variable "password" {
  description = "password, provide through your ENV variables"
}

variable "vpc_security_group_id" {
    type = string
    description = "vpc deafault security group id"
}

variable "vpc_subnet_id" {
    type = string
    description = "vpc subnet  id"
}

variable "vpc_subnet_two_id" {
    type = string
    description = "vpc subnet  id"
}