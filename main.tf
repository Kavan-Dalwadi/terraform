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
  source                = "./module/vpc"
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidr    = var.public_subnet_cidr
  public_b_subnet_cidr  = var.public_b_subnet_cidr
  private_b_subnet_cidr = var.private_b_subnet_cidr
  private_subnet_cidr   = var.private_subnet_cidr
  avability_zone_1      = var.avability_zone_1
  avability_zone_2      = var.avability_zone_2
  avability_zone_3      = var.avability_zone_3
  avability_zone_4      = var.avability_zone_4
  env                   = var.env
  eks_cluster_name      = var.cluster_config.name
}

module "iam" {
  source = "./module/iam"
}

module "eks" {
  source           = "./module/eks"
  cluster_config   = var.cluster_config
  cluster_role_arn = module.iam.EKSClusterRole
  node_role_arn    = module.iam.NodeGroupRole

  env               = var.env
  eks_node_key_name = var.eks_node_key_name

  # eks_ami_id         = var.eks_ami_id
  eks_instance_type  = var.eks_instance_type
  eks_disk_size      = var.eks_disk_size
  eks_volume_type    = var.eks_volume_type
  node_capacity_type = var.node_capacity_type

  private_subnet_id   = module.vpc.vpc_private_subnet_id
  private_b_subnet_id = module.vpc.vpc_private_b_subnet_id
  public_subnet_id    = module.vpc.vpc_public_subnet_id
  public_b_subnet_id  = module.vpc.vpc_public_b_subnet_id
  security_group_id   = module.vpc.vpc_ec2_security_group_id
}


# module "ec2" {
#   source = "./module/ec2"
#   public_key_path = var.public_key_path
#   key_name = var.key_name
#   instance_type = var.instance_type
#   env = var.env
#   ami = var.aws_amis[var.aws_region]
#   ec2_security_group_id = module.vpc.vpc_ec2_security_group_id
#   vpc_subnet_id = module.vpc.vpc_public_subnet_id

#   depends_on = [
#     module.vpc
#   ]
# }

# module "elb" {
#   source = "./module/elb"

#   env = var.env
#   vpc_id = module.vpc.vpc_id
#   vpc_subnet_id = module.vpc.vpc_public_subnet_id
#   aws_instance_web_id = module.ec2.aws_instance_web_id

#   depends_on = [
#     module.vpc,
#     module.ec2
#   ]
# }

# module "rds" {
#   source = "./module/rds"

#   env = var.env
#   allocated_storage      = var.allocated_storage
#   engine                 = var.engine
#   engine_version         = var.engine_version
#   instance_class         = var.instance_class
#   username               = var.username
#   password               = var.password

#   rds_security_group_id = module.vpc.vpc_rds_security_group_id
#   vpc_subnet_id = module.vpc.vpc_public_subnet_id
#   vpc_subnet_two_id = module.vpc.vpc_private_subnet_id

#   rds_cluster_name = var.rds_cluster_name
#   rds_cluster_engine = var.rds_cluster_engine
#   rds_cluster_engine_version = var.rds_cluster_engine_version
#   rds_cluster_instance_class = var.rds_cluster_instance_class
#   rds_cluster_identifier = var.rds_cluster_identifier
#   rds_cluster_username = var.rds_cluster_username
#   rds_cluster_password = var.rds_cluster_password

#   depends_on = [
#     module.vpc
#   ]  
# }
