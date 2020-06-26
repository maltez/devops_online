resource "random_string" "bucket_name" {
  length = 10
  upper = false
  special = false
  number = false
}

resource "aws_s3_bucket" "storage" {
  bucket = random_string.bucket_name.result
  acl = "private"

  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  hash_key = "LockID"
  name = "state_lock"
  read_capacity = 1
  write_capacity = 1

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "terraform_lock"
    Purpose = "terraform_lock"
  }
}