output "address" {
    value = module.elb.address
}

output "db_instance_id" {
  value = module.rds.db_instance_id
}

output "db_subnet_group" {
  value = module.rds.db_subnet_group
}

output "db_instance_address" {
  value = module.rds.db_instance_address
}