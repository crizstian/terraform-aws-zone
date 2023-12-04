# single ecr
# module "ecr" {
#   source = "./modules/ecr"

#   name                  = "nginx"
#   project_family        = "demoecr"
#   environment           = "dev"
#   image_tag_mutability  = "IMMUTABLE"
#   scan_on_push          = true
#   expiration_after_days = 7
#   additional_tags = {
#     Project     = "ECRDemo"
#     Owner       = "anotherbuginthecode"
#     Purpose     = "Reverse Proxy"
#     Description = "NGINX docker image"
#   }
# }


# multiple ecr
module "ecr" {
  source   = "git::https://github.com/anotherbuginthecode/terraform-ecr.git//modules/ecr?ref=main"
  for_each = local.repositories

  name                  = each.key
  project_family        = local.project_family
  environment           = each.value.environment
  image_tag_mutability  = each.value.image_tag_mutability
  scan_on_push          = each.value.scan_on_push
  expiration_after_days = each.value.expiration_after_days
  additional_tags       = each.value.tags
}
