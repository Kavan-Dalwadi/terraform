variable "aws_region" {
  description = "AWS default region."
  type =  string
  default     = "ap-south-1"
}

variable "env" {
    description = "Project environment "
    default = "development"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type = string
  default = "10.0.0.0/16"
}

variable "subnetA_cidr" {
  description = "VPC Subnet A  CIDR"
  type = string
  default = "10.0.0.0/24"
}
   
variable "public_key_path" {
  description = "SSh public key path"
  default = "~/.ssh/tf_aws_keypair.pub"
}

variable "key_name" {
  description = "Desired name of AWS key pair"
  type = string
}

variable "aws_amis" {
  default = {
    ap-south-1 = "ami-0756a1c858554433e"
  }
}