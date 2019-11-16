locals {
  env          = "dev"
  profile      = "374047294805"
  service_name = "terraform-vpc"

  tags = {
    Name        = "${local.profile}-${local.service_name}"
    Environment = local.env
    Application = local.service_name
    Service     = local.service_name
    GitRepo     = "github.com/neemiasjnr/${local.service_name}"
    Owner       = "neemias.junior@gmail.com"
    ManagedBy   = "terraform"
  }
}
