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

variable "public_subnet_cidr" {
  description = "VPC Subnet Public  CIDR"
  type = string
  default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  description = "VPC Subnet Private  CIDR"
  type = string
  default = "10.0.16.0/24"
}
   
variable "public_key_path" {
  description = "SSh public key path"
  default = "~/.ssh/tf_aws_keypair.pub"
}

variable "key_name" {
  description = "Desired name of AWS key pair"
  type = string
  default = "tf_aws_keypair"
}

variable "instance_type" {
  description = "AWS EC2 instance type DEV"
  type = string
  default = "t2.micro"
}

variable "aws_amis" {
  default = {
    ap-south-1 = "ami-0756a1c858554433e"
  }
}
