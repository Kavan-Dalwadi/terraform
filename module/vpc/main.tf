resource "aws_vpc" "default" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    tags = {
      "Name" = "${var.env}-tf-vpc"
    }
}

resource "aws_internet_gateway" "default" {
    vpc_id = aws_vpc.default.id

    tags = {
      "Name" = "${var.env}-tf-ig"
    }
}

resource "aws_route" "internet_access" {
    route_table_id         = aws_vpc.default.main_route_table_id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = aws_internet_gateway.default.id
}

resource "aws_subnet" "public" {
    vpc_id                  = aws_vpc.default.id
    cidr_block              = var.public_subnet_cidr
    map_public_ip_on_launch = true
    availability_zone = var.az_1

    tags = {
      "Name" = "${var.env}-tf-public-subnet"
    }
}

resource "aws_subnet" "private" {
    vpc_id                  = aws_vpc.default.id
    cidr_block              = var.private_subnet_cidr
    map_public_ip_on_launch = false
    availability_zone = var.az_2

    tags = {
      "Name" = "${var.env}-tf-private-subnet"
    }
}

resource "aws_eip" "default" {
   vpc   = true

    tags = {
      "Name" = "${var.env}-tf-ElasticIP"
    }
 }

# resource "aws_nat_gateway" "default" {
#   allocation_id = aws_eip.default.id
#   subnet_id = aws_subnet.public.id
  
#     tags = {
#       "Name" = "${var.env}-tf-NAT-Gateway"
#     }
# }

resource "aws_security_group" "default_ec2" {
    name        = "${var.env}-tf-ec2"
    description = "Used in the terraform"
    vpc_id      = aws_vpc.default.id


    ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/16"]
    }

    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      "Name" = "${var.env}-tf-sg"
    }
}


resource "aws_security_group" "default_rds" {
    name        = "${var.env}-tf-rds"
    description = "Used in the terraform"
    vpc_id      = aws_vpc.default.id


    ingress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      security_groups = [ aws_security_group.default_ec2.id ]
    }

    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      "Name" = "${var.env}-tf-sg"
    }
}