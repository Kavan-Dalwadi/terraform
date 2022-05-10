variable "env" {
    description = "Project environment"
    type = string
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type = string
}

variable "subnetA_cidr" {
  description = "VPC Subnet A  CIDR" 
  type = string
}