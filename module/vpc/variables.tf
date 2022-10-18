variable "env" {
  description = "Project environment"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "public_subnet_cidr" {
  description = "VPC Subnet Public  CIDR"
  type        = string
}

variable "public_b_subnet_cidr" {
  description = "VPC Subnet Public  CIDR"
  type        = string
}

variable "private_b_subnet_cidr" {
  description = "VPC Subnet Public  CIDR"
  type        = string
}

variable "private_subnet_cidr" {
  description = "VPC Subnet Private  CIDR"
  type        = string
}

variable "az_1" {
  description = "Your Az1, use AWS CLI to find your account specific"
}

variable "az_2" {
  description = "Your Az2, use AWS CLI to find your account specific"
}

variable "az_3" {
  description = "Your Az3, use AWS CLI to find your account specific"
}

variable "az_4" {
  description = "Your Az4, use AWS CLI to find your account specific"
}

variable "eks_cluster_name" {}
