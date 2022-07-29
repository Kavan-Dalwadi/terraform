output "vpc_id" {
    value = aws_vpc.default.id
}

output "vpc_subnet_id" {
    value = aws_subnet.default.id
}


output "vpc_subnet_two_id" {
    value = aws_subnet.default_two.id
}

output "vpc_security_group_id" {
        value = aws_security_group.default.id
}
