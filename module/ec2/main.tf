locals {
  user_data = <<-EOT
  #!/bin/bash
  echo "Hello Terraform!"
  EOT
}

resource "aws_key_pair" "auth" {
    key_name   = var.key_name
    public_key = file(var.public_key_path)
}

resource "aws_instance" "web" {
    
    instance_type = "t2.micro"
    ami                    =  var.ami 
    key_name               = aws_key_pair.auth.id
    vpc_security_group_ids = [var.ec2_security_group_id]
    subnet_id              = var.vpc_subnet_id

    user_data_base64       = base64encode(local.user_data)

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


#-------------User Data--------------------#

# resource "aws_instance" "ec2" {
#   count         = "${var.ec2_count}"
#   ami           = "${var.ami_id}"
#   instance_type = "${var.instance_type}"
#   subnet_id     = "${var.subnet_id}"
#   vpc_security_group_ids = [var.aws_security_group]
#   associate_public_ip_address = "${var.associate_public_ip_address}"
#   key_name = "${var.key_name}"
#   user_data = "${file("${var.user_data_file}")}"
  

#   tags = {
#     Name = "${var.instance_name}"
#   }
# }

# variable "user_data_file" {
#     type = string
#     default = "/home/omdhimar/Desktop/newfolder/setup.sh"
# }

#-------------User Data--------------------#