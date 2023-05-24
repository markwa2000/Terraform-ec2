data "aws_vpc" "myvpc" {
  default = true
}
data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.myvpc.id]
  }
}
data "aws_ami" "myami" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "tag:Name"
    values = ["amazon-linux"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
/* 
data "aws_lb" "alb" {
  arn  = var.aws_lb
  name = var.lb_name
} */