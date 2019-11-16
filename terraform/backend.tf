resource "aws_s3_bucket" "backend-s3" {
  bucket = "${local.profile}-tfstate"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = local.tags
}

resource "aws_dynamodb_table" "backend-dynamo" {
  name           = "${local.profile}-tfstate-lock"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = local.tags
}
