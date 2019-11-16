terraform {
  required_version = "~> 0.12.0"
}

provider "aws" {
  alias   = "eu-central-1"
  region  = "eu-central-1"
  profile = local.profile
}