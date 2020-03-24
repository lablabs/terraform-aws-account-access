module "label" {
  source      = "../label"
  namespace   = var.namespace
  environment = var.environment
  name        = var.name
  tags        = var.tags
}
