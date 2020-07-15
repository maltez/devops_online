resource "aws_s3_bucket" "static" {
  bucket = local.bucket_settings.bucket
  acl    = local.bucket_settings.acl
  policy = templatefile("./policy/policy.s3.json", local.bucket_settings)

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_object" "this" {
  count  = length(local.files)
  bucket = aws_s3_bucket.static.bucket
  key    = local.files[count.index]
  source = "./content/${local.files[count.index]}"
}
