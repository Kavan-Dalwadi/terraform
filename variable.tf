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
  default = "114.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "VPC Subnet A  CIDR"
  type = string
  default = "114.0.16.0/24"
}

variable "private_subnet_cidr" {
  description = "VPC Subnet B  CIDR"
  type = string
  default = "114.0.0.0/24"
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

variable "instance_type" {
  description = "AWS EC2 instance type"
  type = string
  default = "t2.micro"
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
  default = 40
  type = number
  description = "Storage size in GB"
}

variable "engine" {
  default     = "aurora"
  description = "Engine type, example values mysql, postgres, aurora-mysql"
}

variable "engine_version" {
  description = "Engine version"
  default = "5.7.12"
  type = string
}

variable "instance_class" {
  default     = "db.t2.small"
  description = "Instance class"
}


variable "username" {
  default     = "myuser"
  description = "User name"
}

variable "password" {
  description = "password, provide through your ENV variables"
}

variable "s3_bucket_name" {
  type = string
  default = "terraform-backup-18ce015"
}

variable "cluster_config" {
  type = object({
    name    = string
    version = string
  })
  default = {
    name    = "eks-cluster"
    version = "1.22"
  }
}

variable "rds_cluster_name" {
  default     = "auroraMySQL"
  description = "RDS name"
}

variable "rds_cluster_identifier" {
  default     = "aurora-cluster-demo"
  description = "Engine type, example values mysql, postgres, aurora-mysql"
}

variable "rds_cluster_engine" {
  default     = "aurora-mysql"
  description = "Engine type, example values mysql, postgres, aurora-mysql"
}

variable "rds_cluster_engine_version" {
  description = "Engine version"
  default = "5.7.mysql_aurora.2.10.2"
  type = string
}

variable "rds_cluster_instance_class" {
  default     = "db.t2.small"
  description = "Instance class"
}


variable "rds_cluster_username" {
  default     = "myuser"
  description = "User name"
}

variable "rds_cluster_password" {
  description = "password, provide through your ENV variables"
}