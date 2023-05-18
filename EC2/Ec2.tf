provider "aws" {region = "ap-southeast-2"}
resource "aws_security_group" "apache-sg" {
  name        = "apache"
  description = "Allow apache inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "apache from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
 ingress {
    description      = "apache from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "apache"
  }
}

resource "aws_instance" "apache" {
ami = var.ami_id
instance_type = var.instance_type
security_groups = [aws_security_group.apache-sg.id]
subnet_id = var.subnet_id
}
