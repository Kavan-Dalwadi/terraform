# #--------------------------------------------------
# #           EKS Cluster Role
# #--------------------------------------------------
# resource "aws_iam_role" "EKSClusterRole" {
#   name = "EKSClusterRole"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Principal = {
#           Service = "eks.amazonaws.com"
#         }
#       },
#     ]
#   })
# }
# #--------------------------------------------------
# #          NodeGroupRole
# #--------------------------------------------------
# resource "aws_iam_role" "NodeGroupRole" {
#   name = "EKSNodeGroupRole"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       },
#     ]
#   })
# }

# #--------------------------------------------------
# #          Policy Attach to Cluster
# #--------------------------------------------------
# resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
#   role       = aws_iam_role.EKSClusterRole.name
# }

# #--------------------------------------------------
# #          Policy Attach to NodeGroup
# #--------------------------------------------------
# resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
#   role       = aws_iam_role.NodeGroupRole.name
# }

# #--------------------------------------------------
# #  read-only access to Amazon EC2 Container Registry repositories
# #--------------------------------------------------
# resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
#   role       = aws_iam_role.NodeGroupRole.name
# }

# #--------------------------------------------------
# #  describe, and modify Elastic Network Interfaces
# #--------------------------------------------------
# resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
#   role       = aws_iam_role.NodeGroupRole.name
# }

resource "aws_iam_role" "lambda" {
  name = var.lambda_role_name

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}
