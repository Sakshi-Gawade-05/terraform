#Create a s3 bucket

resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucketname
}

#need to define ownership of the bucket

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
#make the bucket public
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.mybucket.id
  acl    = "public-read"
}
#put the files in s3
resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.mybucket.id
  key = "index.html"
  source = "index.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "error" {
  bucket = aws_s3_bucket.mybucket.id
  key = "error.html"
  source = "error.html"
  acl = "public-read"
  content_type = "text/html"
}
#to put files in s3

resource "aws_s3_object" "index" {
  bucket = "aws_s3_bucket.mybucket.id"
  key    = "index.html"     #name of the file
  source = "index.html"     #where is the file
  acl    = public_read
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket = "aws_s3_bucket.mybucket.id"
  key    = "error.html"     
  source = "error.html"     
  acl    = "public_read"
  content_type = "text/html"
}

resource "aws_s3_object" "profile" {
  bucket = "aws_s3_bucket.mybucket.id"
  key    = "profile.png"     
  source = "profile.png"    
  acl    = "public_read"
}