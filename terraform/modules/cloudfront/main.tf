resource "aws_cloudfront_distribution" "s3" {
  origin {
    domain_name = var.s3_site_bucket_domain_name
    origin_id   = "${var.app_name}-${var.app_env}-site-s3-origin"
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${var.app_name}-${var.app_env}-site-s3-origin"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  viewer_certificate {
    acm_certificate_arn = var.acm_certificate_arn
    ssl_support_method  = "sni-only"
  }

  price_class = var.price_class

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = var.whitelisted_locations
    }
  }
}
