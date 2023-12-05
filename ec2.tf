resource "aws_launch_template" "ecs_lt" {
  name_prefix   = "ecs-template"
  image_id      = var.instance_ami_id
  instance_type = var.instance_type

  key_name               = "terraform-cristian-key"
  vpc_security_group_ids = var.vpc_security_group_ids

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 30
      volume_type = "gp3"
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = var.ecs_instance_name
    }
  }

  user_data = filebase64("${path.module}/ecs.sh")
}

resource "aws_autoscaling_group" "ecs_asg" {
  vpc_zone_identifier = var.vpc_subnets
  desired_capacity    = 2
  max_size            = 2
  min_size            = 2

  launch_template {
    id      = aws_launch_template.ecs_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "AmazonECSManaged"
    value               = true
    propagate_at_launch = true
  }
}
