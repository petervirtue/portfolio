variable "app_name" {
  type = string
}

variable "app_env" {
  type = string
}

variable "s3_site_bucket_domain_name" {
  type = string
}

variable "price_class" {
  type = string
}

variable "whitelisted_locations" {
  type = list(string)
}

variable "acm_certificate_arn" {
  type = string
}
