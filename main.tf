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

# module "vpc" {
#   source = "./module/vpc"
#   vpc_cidr = var.vpc_cidr
#   public_subnet_cidr = var.public_subnet_cidr
#   private_subnet_cidr = var.private_subnet_cidr
#   az_1 = var.az_1
#   az_2 = var.az_2
#   env = var.env
# }

# module "ec2" {
#   source = "./module/ec2"
#   public_key_path = var.public_key_path
#   key_name = var.key_name
#   instance_type = var.instance_type
#   env = var.env
#   ami = var.aws_amis[var.aws_region]
#   ec2_security_group_id = module.vpc.vpc_ec2_security_group_id
#   vpc_subnet_id = module.vpc.vpc_public_subnet_id
#   user_data_file = var.user_data_file
  
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

module "iam" {
  source = "./module/iam"

  lambda_role_name = var.lambda_role_name
  #eks-role-policy = var.aws_iam_role_policy_attachment
}

# module "eks_cluster" {
#   source = "./modules/eks_cluster"
#   cluster_config = var.cluster_config
#   role_arn = module.iam.EKSClusterRole
#   public_subnets_id = module.vpc.vpc_public_subnet_id
#   private_subnets_id = module.vpc.vpc_private_subnet_id
#   security_group_id = module.vpc.vpc_ec2_security_group_id
#   node_role_arn = module.iam.NodeGroupRole

#   depends_on = [
#     module.vpc 
#   ]
# }





# module "apigw" {
#   source = "./module/apigw"

#   api_authorization = var.api_authorization
#   api_integration_http_method = var.api_integration_http_method
#   api_http_method = var.api_http_method
#   api_name = var.api_name
#   api_path_part = var.api_path_part
#   api_type = var.api_type

#   statement_id  = var.statement_id
#   action        = var.action
#   principal     = var.principal
#   function_name = module.lambda.lambda_function
#   accountId     = var.accountId
#   aws_region    = var.aws_region

#   depends_on = [
#     module.lambda
#   ]
# }

module lambda{
   source = "./module/lambda"

    lambdaRole    = module.iam.lambdaRole
    filename      = var.filename
    function_name = var.function_name
    handler       = var.handler
    runtime       = var.runtime

   depends_on = [
     module.iam
   ]
}
