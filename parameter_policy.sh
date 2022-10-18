POLICY_ARN=$(aws --region "ap-south-1" --query Policy.Arn --output text iam create-policy --policy-name nginx-parameter-deployment-policy --policy-document '{
    "Version": "2012-10-17",
    "Statement": [ {
        "Effect": "Allow",
        "Action": ["ssm:GetParameter", "ssm:GetParameters"],
        "Resource": ["*"]
    } ]
}')
