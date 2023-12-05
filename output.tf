output "ecs_cluster_name" {
  value = aws_ecs_cluster.ecs_cluster.name
}
output "ecs_cluster_id" {
  value = aws_ecs_cluster.ecs_cluster.id
}
output "ecs_capacity_provider" {
  value = aws_ecs_capacity_provider.ecs_capacity_provider.name
}
output "aws_lb_target_group" {
  value = aws_lb_target_group.ecs_tg.arn
}
