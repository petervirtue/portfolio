resource "aws_s3_bucket" "site" {
  bucket = "${var.app_name}-${var.app_env}-site"

  tags = {
    Name        = "${title(var.app_name)}SiteBucket"
    Environment = "${title(var.app_env)}"
  }
}

resource "aws_s3_bucket_website_configuration" "site" {
  bucket = aws_s3_bucket.site.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }
}

resource "aws_s3_bucket_public_access_block" "site_access_block" {
  bucket = aws_s3_bucket.site.id

  block_public_policy     = false
  restrict_public_buckets = false
  block_public_acls       = false
  ignore_public_acls      = false
}

resource "aws_s3_bucket_policy" "site" {
  bucket = aws_s3_bucket.site.bucket

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = ["s3:GetObject"]
        Effect    = "Allow"
        Resource  = "${aws_s3_bucket.site.arn}/*"
        Principal = "*"
      },
    ]
  })
}
