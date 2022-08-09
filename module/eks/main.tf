resource "aws_eks_cluster" "eks-cluster" {
  name     = var.cluster_config.name
  role_arn = var.role_arn
  version  = var.cluster_config.version

  vpc_config {
    subnet_ids         = flatten([var.public_subnets_id, var.private_subnets_id])
    security_group_ids = flatten([var.security_group_id])
  }

  # depends_on = [
  #   aws_iam_role_policy_attachment.AmazonEKSClusterPolicy
  # ]
}


resource "aws_eks_node_group" "node-ec2" {
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_group_name = "t3_micro-node_group"
  node_role_arn   = var.node_role_arn
  subnet_ids      = flatten([var.private_subnets_id])

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  ami_type       = "AL2_x86_64"
  instance_types = ["t3.micro"]
  capacity_type  = "ON_DEMAND"
  disk_size      = 20

  # depends_on = [
  #   aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
  #   aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  #   aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy
  # ]
}
