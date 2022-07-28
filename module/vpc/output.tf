output "vpc_id" {
    value = aws_vpc.default.id
}

output "vpc_public_subnet_id" {
    value = aws_subnet.public.id
}

output "vpc_private_subnet_id" {
    value = aws_subnet.private.id
}

output "vpc_security_group_id" {
    value = aws_security_group.default.id
}