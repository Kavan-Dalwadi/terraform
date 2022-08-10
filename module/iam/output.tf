# output "AmazonEKSClusterPolicy" {
#     value = aws_iam_role_policy_attachment.AmazonEKSClusterPolicy.policy_arn
  
# }

# output "AmazonEKSWorkerNodePolicy" {
#     value = aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy.policy_arn
# }

# output "AmazonEC2ContainerRegistryReadOnly" {
#     value = aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly.policy_arn
# }

# output "AmazonEKS_CNI_Policy" {
#     value = aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy.policy_arn
  
# }

# output "EKSClusterRole" {
#     value = aws_iam_role.EKSClusterRole.arn
  
# }

# output "NodeGroupRole" {
#     value = aws_iam_role.NodeGroupRole.arn
# }

output "lambdaRole" {
  value = aws_iam_role.lambda
}