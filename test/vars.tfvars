ecs_cluster_name  = "harness-ftt"
ecs_instance_name = "harness-ftt"
ecs_alb_name      = "harness-ftt"

instance_type   = "t3.medium"
instance_ami_id = "ami-093467ec28ae4fe03"

vpc_id                 = "vpc-51edc228"
vpc_subnets            = ["subnet-682a8223", "subnet-bef497e4"]
vpc_security_group_ids = ["sg-e508239b"]
