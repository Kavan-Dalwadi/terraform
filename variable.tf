variable "aws_region" {
  description = "AWS default region."
  type =  string
  default     = "ap-south-1"
}

variable "env" {
    description = "Project environment.. "
    default = "prod"
}

variable "vpc_cidr" {
  description = "VPC CIDR.."
  type = string
  default = "10.0.0.0/16"
}

variable "subnetA_cidr" {
  description = "VPC Subnet A  CIDR"
  type = string
  default = "10.0.1.0/24"
}

variable "subnetB_cidr" {
  description = "VPC Subnet B  CIDR"
  type = string
  default = "10.0.2.0/24"
} 

variable "az_1" {
  default     = "ap-south-1b"
  description = "Your Az1, use AWS CLI to find your account specific"
}

variable "az_2" {
  default     = "ap-south-1c"
  description = "Your Az2, use AWS CLI to find your account specific"
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

variable "aws_amis" {
  default = {
    ap-south-1 = "ami-0756a1c858554433e"
  }
}


variable "allocated_storage" {
  default = "10"
  description = "Storage size in GB"
}

variable "engine" {
  default     = "mysql"
  description = "Engine type, example values mysql, postgres"
}

variable "engine_version" {
  description = "Engine version"
  default = {
    mysql    = "5.7.21"
  }
}

variable "instance_class" {
  default     = "db.t2.micro"
  description = "Instance class"
}


variable "username" {
  default     = "myuser"
  description = "User name"
}

variable "password" {
  description = "password, provide through your ENV variables"
}
