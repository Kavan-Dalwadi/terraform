resource "aws_db_instance" "default" {
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  db_name                = "kavanMysql"
  username               = var.username
  password               = var.password
  vpc_security_group_ids = [var.vpc_security_group_id]
  db_subnet_group_name   = aws_db_subnet_group.default.id
}

resource "aws_db_subnet_group" "default" {
  name        = "${var.env}-tf-db-sg"
  subnet_ids  = [var.vpc_subnet_id,var.vpc_subnet_two_id]
}