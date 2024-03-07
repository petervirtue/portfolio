variable "aws_profile" {
  type        = string
  description = "AWS CLI Profile"
}

variable "aws_region" {
  type = string
}

variable "app_name" {
  type = string
}

variable "app_env" {
  type = string
}

variable "acm_certificate_arn" {
  type = string
}

variable "cloudfront_price_class" {
  type = string
}

variable "github_owner" {
  type = string
}

variable "github_repo" {
  type = string
}

variable "github_branch" {
  type = string
}

variable "github_token" {
  description = "GitHub personal access token"
  type        = string
}
