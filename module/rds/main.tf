# resource "aws_db_instance" "default" {
#   allocated_storage      = var.allocated_storage
#   engine                 = var.engine
#   engine_version         = var.engine_version
#   instance_class         = var.instance_class
#   db_name                = "kavanMysql"
#   username               = var.username
#   password               = var.password
#   vpc_security_group_ids = [var.vpc_security_group_id]
#   db_subnet_group_name   = aws_db_subnet_group.default.id
# }

resource "aws_db_subnet_group" "default" {
  name        = "${var.env}-tf-db-sg"
  subnet_ids  = [var.vpc_subnet_id,var.vpc_subnet_two_id]
}

resource "aws_rds_cluster" "default" {
  cluster_identifier      = var.rds_cluster_identifier
  engine                  = var.rds_cluster_engine
  engine_version          = var.rds_cluster_engine_version
#  db_cluster_instance_class = var.rds_cluster_instance_class
  database_name           = var.rds_cluster_name
  master_username         = var.rds_cluster_username
  master_password         = var.rds_cluster_password
  
  skip_final_snapshot = true
  
  db_subnet_group_name   = aws_db_subnet_group.default.id
  vpc_security_group_ids = [var.rds_security_group_id]
}

resource "aws_rds_cluster_instance" "cluster_instances" {

  count              = 1
  identifier         = "rds-${count.index}"
  cluster_identifier = aws_rds_cluster.default.id
  instance_class     = var.rds_cluster_instance_class
  engine             = aws_rds_cluster.default.engine
  engine_version     = aws_rds_cluster.default.engine_version

}