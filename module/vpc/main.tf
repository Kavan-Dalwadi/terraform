resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
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

#----------- Public Subnet-A---------------------#
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.avability_zone_1

  tags = {
    "Name"                                          = "${var.env}-public-subnet-a"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "owned"
    "kubernetes.io/role/elb"                        = "1"
  }
}
resource "aws_route_table" "public_table_a" {
  vpc_id = aws_vpc.default.id
  tags = {
    "Name" = "${var.env}-public-a"
  }
}
resource "aws_route" "internet_public_a" {
  route_table_id         = aws_route_table.public_table_a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id

}
resource "aws_route_table_association" "assoc_public_routes_a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_table_a.id
}

#----------- Public Subnet-B---------------------#
resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.public_b_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.avability_zone_2

  tags = {
    "Name"                                          = "${var.env}-public-subnet-b"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "owned"
    "kubernetes.io/role/elb"                        = "1"
  }
}
resource "aws_route_table" "public_table_b" {
  vpc_id = aws_vpc.default.id
  tags = {
    "Name" = "${var.env}-public-b"
  }
}
resource "aws_route" "internet_public_b" {
  route_table_id         = aws_route_table.public_table_b.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id

}
resource "aws_route_table_association" "assoc_public_routes_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public_table_b.id
}

#----------- Private Subnet-B---------------------#
resource "aws_subnet" "private_b" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.private_b_subnet_cidr
  map_public_ip_on_launch = false
  availability_zone       = var.avability_zone_2

  tags = {
    "Name"                                          = "${var.env}-private-subnet-b"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "owned"
  }
}

resource "aws_route" "private_routes_b" {
  route_table_id         = aws_route_table.private_table_b.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.default.id
}

resource "aws_route_table" "private_table_b" {
  vpc_id = aws_vpc.default.id
  tags = {
    "Name" = "${var.env}-private-b"
  }
}
resource "aws_route_table_association" "assoc_private_routes_b" {
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.private_table_b.id
}

#----------- Private Subnet-a---------------------#
resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.private_subnet_cidr
  map_public_ip_on_launch = false
  availability_zone       = var.avability_zone_1

  tags = {
    "Name"                                          = "${var.env}-private-subnet-a"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "owned"
  }
}
resource "aws_route_table" "private_table_a" {
  vpc_id = aws_vpc.default.id
  tags = {
    "Name" = "${var.env}-private-a"
  }
}
resource "aws_route" "private_routes" {
  route_table_id         = aws_route_table.private_table_a.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.default.id
}
resource "aws_route_table_association" "assoc_private_routes" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private_table_a.id
}
resource "aws_eip" "default" {
  vpc = true

  tags = {
    "Name" = "${var.env}-ElasticIP"
  }
}

resource "aws_nat_gateway" "default" {
  allocation_id = aws_eip.default.id
  subnet_id     = aws_subnet.public.id

  tags = {
    "Name" = "${var.env}-NAT-Gateway"
  }
}

resource "aws_security_group" "default_ec2" {
  name        = "${var.env}-ec2"
  description = "Used in the terraform"
  vpc_id      = aws_vpc.default.id


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr, "120.72.93.91/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "${var.env}-eks-sg"
  }
}
