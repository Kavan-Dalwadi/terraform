resource "aws_eks_cluster" "eks-cluster" {
  name     = "${var.env}-${var.cluster_config.name}"
  role_arn = var.cluster_role_arn
  version  = var.cluster_config.version

  vpc_config {
    subnet_ids         = flatten([var.private_subnet_id, var.private_b_subnet_id, var.public_subnet_id, var.public_b_subnet_id])
    security_group_ids = flatten([var.security_group_id])

    endpoint_private_access = false
    endpoint_public_access  = true
  }

  # depends_on = [
  #   aws_iam_role_policy_attachment.AmazonEKSClusterPolicy
  # ]
}

data "aws_launch_template" "eks_node_group" {
  name = aws_launch_template.eks_node_group.name

  depends_on = [aws_launch_template.eks_node_group]
}

resource "aws_launch_template" "eks_node_group" {
  instance_type = var.eks_instance_type
  image_id      = var.eks_ami_id
  name          = "${var.env}-lt"
  key_name      = aws_key_pair.auth.key_name
  network_interfaces {
    associate_public_ip_address = false
    security_groups = [var.security_group_id]
  }

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = var.eks_disk_size
      volume_type = var.eks_volume_type
    }
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "EKS-MANAGED-NODE"
    }
  }
}

resource "aws_key_pair" "auth" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_eks_node_group" "node-ec2" {
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_group_name = "t3_micro-node_group"
  node_role_arn   = var.node_role_arn
  subnet_ids      = flatten([var.private_subnet_id, var.private_b_subnet_id])

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  launch_template {
    id      = data.aws_launch_template.eks_node_group.id
    version = data.aws_launch_template.eks_node_group.latest_version
  }

}

# resource "aws_eks_node_group" "linux_node-ec2" {
#   cluster_name    = aws_eks_cluster.eks-cluster.name
#   node_group_name = "t3_micro-node_group"
#   node_role_arn   = var.node_role_arn
#   subnet_ids      = flatten([var.private_subnet_id, var.private_b_subnet_id])

#   scaling_config {
#     desired_size = 1
#     max_size     = 2
#     min_size     = 1
#   }

#   instance_types = [var.eks_instance_type]
#   capacity_type  = var.node_capacity_type
#   disk_size      = var.eks_disk_size

# }
