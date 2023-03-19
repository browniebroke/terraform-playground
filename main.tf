module "main" {
  source = "./modules"

  rds_password = var.rds_password
}
