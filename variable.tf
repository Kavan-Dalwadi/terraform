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

# For Lambda and API Gateway Integration

variable "accountId" {
  description = "AWS Account ID"
}

variable "lambda_role_name" {
  description = "Lambda IAM Role Name"
  default = "lambdaRole"
}

variable "filename" {
  description = "lambda function file name"
  default = "lambda.zip"
  type = string
}

variable "function_name" {
  default = "my_function"
  description = "lambda function name"
  type = string
}

variable "handler" {
  default = "lambda.lambda_handler"
  description = "Lambda function handler"
  type = string
}

variable "runtime" {
  default = "python3.7"
  description = "Lambda function runtime"
  type = string
}

variable "statement_id" {
  default = "AllowExecutionFromAPIGateway"
  description = "IAM statement ID"
}

variable "action" {
  default = "lambda:InvokeFunction"
  description = "IAM Lambda Description"
}

variable "principal" {
  default = "apigateway.amazonaws.com"
  description = "IAM Lambda Principal"
}

# API Gateway

variable "api_name" {
  default = "myapi"
  description = "API Name"
  type =  string
}

variable "api_path_part" {
  default = "resource"
  description = "value"
  type = string
}

variable "api_http_method" {
  default = "GET"
  description = "Api gateway method"
  type = string
}

variable "api_authorization" {
  default = "NONE"
  description = "API Gateway Authorization"
  type =  string
}

variable "api_integration_http_method" {
  default = "POST"
  description = "API HTTP method integration"
}

variable "api_type" {
  default = "AWS_PROXY"
  description = "API GW Integration type"
}