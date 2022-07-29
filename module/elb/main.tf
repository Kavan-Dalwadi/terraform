resource "aws_security_group" "elb" {
  name        = "${var.env}-elb-sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}

resource "aws_elb" "web" {
  name = "${var.env}-elb"

  subnets         = [var.vpc_subnet_id]
  security_groups = [aws_security_group.elb.id]
  instances       = [var.aws_instance_web_id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}
