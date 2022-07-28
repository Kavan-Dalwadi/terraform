resource "aws_db_instance" "default" {
  allocated_storage    = var.allocated_storage
  engine               = "${var.engine}"
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  name                 = var.name
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = var.skip_final_snapshot
}