output "vpc_id" {
  value = aws_vpc.default.id
}

output "vpc_public_subnet_id" {
  value = aws_subnet.public.id
}

output "vpc_public_b_subnet_id" {
  value = aws_subnet.public_b.id
}

output "vpc_private_b_subnet_id" {
  value = aws_subnet.private_b.id
}

output "vpc_private_subnet_id" {
  value = aws_subnet.private.id
}

output "vpc_ec2_security_group_id" {
  value = aws_security_group.default_ec2.id
}

# output "vpc_rds_security_group_id" {
#     value = aws_security_group.default_rds.id
# }
