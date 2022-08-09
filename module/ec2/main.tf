resource "aws_key_pair" "auth" {
    key_name   = var.key_name
    public_key = file(var.public_key_path)
}

resource "aws_instance" "web" {
    
    instance_type = "t2.micro"
    ami =  var.ami 
    key_name = aws_key_pair.auth.id
    vpc_security_group_ids = [var.ec2_security_group_id]
    subnet_id = var.vpc_subnet_id

    user_data = <<EOF
#!/bin/bash
echo "Hello"
EOF

    tags = {
      "Name" = "${var.env}-tf-server"
    }
}

# resource "aws_ami_from_instance" "web" {
#   name               = "web-ami"
#   source_instance_id = aws_instance.web.id

#   tags = {
#       "Name" = "${var.env}-tf-ami"
#     }
# }
