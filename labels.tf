module "label" {
  source  = "lablabs/label/null"
  version = "0.16.0"
  namespace   = var.namespace
  environment = var.environment
  name        = var.name
  tags        = var.tags
}
