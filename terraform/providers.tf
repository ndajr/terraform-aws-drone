terraform {
  required_version = "~> 0.12.0"

  backend "s3" {
    encrypt        = true
    bucket         = "374047294805-tfstate"
    dynamodb_table = "374047294805-tfstate-lock"
    region         = "eu-central-1"
    key            = "platform/service.tfstate"
  }
}

provider "aws" {
  alias   = "eu-central-1"
  region  = "eu-central-1"
  profile = local.profile
}
