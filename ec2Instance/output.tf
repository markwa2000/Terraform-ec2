output "vpc" {
  value = data.aws_vpc.myvpc.id
}
output "subnets" {
  value = data.aws_subnets.subnets.ids[0]
}
output "ami" {
  value = data.aws_ami.myami.id
}
/* output "alb" {
  value = data.aws_lb.alb
} */