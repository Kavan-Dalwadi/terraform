terraform {
  required_version = ">= 0.12"
  backend "local" {
     path = "./terraform.tfstate"
#    for s3 backend    
#    bucket = "terraform-backup-18ce015"
#    key    = "production/terraform.tfstate"
#    region = "ap-south-1"
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./module/vpc"
  vpc_cidr = var.vpc_cidr
  subnetA_cidr = var.subnetA_cidr
  subnetB_cidr = var.subnetB_cidr
  az_1 = var.az_1
  az_2 = var.az_2
  env = var.env
}

module "ec2" {
  source = "./module/ec2"
  public_key_path = var.public_key_path
  key_name = var.key_name
  env = var.env
  ami = var.aws_amis[var.aws_region]
  vpc_security_group_id = module.vpc.vpc_security_group_id
  vpc_subnet_id = module.vpc.vpc_subnet_id

  depends_on = [
    module.vpc
  ]
}

module "elb" {
  source = "./module/elb"

  env = var.env
  vpc_id = module.vpc.vpc_id
  vpc_subnet_id = module.vpc.vpc_subnet_id
  aws_instance_web_id = module.ec2.aws_instance_web_id

  depends_on = [
    module.vpc,
    module.ec2
  ]
}

module "rds" {
  source = "./module/rds"

  env = var.env
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version[var.engine]
  instance_class         = var.instance_class
  username               = var.username
  password               = var.password

  vpc_security_group_id = module.vpc.vpc_security_group_id
  vpc_subnet_id = module.vpc.vpc_subnet_id
  vpc_subnet_two_id = module.vpc.vpc_subnet_two_id

  depends_on = [
    module.vpc
  ]  
}
