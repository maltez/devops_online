//resource "aws_s3_bucket" "static" {
//  bucket = "my-random-bucket-123"
//  acl = "public-read"
//
//  policy = templatefile("./template/policy.json", { bucket = "my-random-bucket-123" })
//
//  website {
//    index_document = "index.html"
//    error_document = "error.html"
//  }
//}
//
//resource "aws_s3_bucket_object" "index" {
//  bucket = aws_s3_bucket.static.bucket
//  key = "index.html"
//  source = "./content/index.html"
//}
//
//resource "aws_s3_bucket_object" "error" {
//  bucket = aws_s3_bucket.static.bucket
//  key = "error.html"
//  source = "./content/error.html"
//}
