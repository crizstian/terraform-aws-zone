variable "ecs_cluster_name" {}
variable "ecs_instance_name" {}
variable "ecs_alb_name" {}

variable "instance_type" {}
variable "instance_ami_id" {}

variable "vpc_id" {
  default = "vpc-51edc228"
}
variable "vpc_subnets" {
  type    = list(string)
  default = ["subnet-682a8223", "subnet-bef497e4"]
}
variable "vpc_security_group_ids" {
  type    = list(string)
  default = ["sg-e508239b"]
}
