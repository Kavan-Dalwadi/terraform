resource "aws_vpc" "default" {
    cidr_block = var.vpc_cidr

    tags = {
      "Name" = "${var.env}-vpc"
    }
}

resource "aws_internet_gateway" "default" {
    vpc_id = aws_vpc.default.id

    tags = {
      "Name" = "${var.env}-ig"
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

    tags = {
      "Name" = "${var.env}-public-subnet"
    }
}

resource "aws_subnet" "private" {
    vpc_id                  = aws_vpc.default.id
    cidr_block              = var.private_subnet_cidr
    map_public_ip_on_launch = false

    tags = {
      "Name" = "${var.env}-private-subnet"
    }
}

resource "aws_security_group" "default" {
    name        = "${var.env}-terraform_example"
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
      cidr_blocks = ["10.0.0.0/16"]
    }

    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      "Name" = "${var.env}-sg"
    }
}