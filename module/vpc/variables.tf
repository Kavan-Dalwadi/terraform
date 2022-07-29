variable "env" {
    description = "Project environment"
    type = string
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type = string
}

variable "public_subnet_cidr" {
  description = "VPC Subnet Public  CIDR" 
  type = string
}

variable "private_subnet_cidr" {
  description = "VPC Subnet Private  CIDR" 
  type = string
}

variable "az_1" {
  description = "Your Az1, use AWS CLI to find your account specific"
}

variable "az_2" {
  description = "Your Az2, use AWS CLI to find your account specific"
}
