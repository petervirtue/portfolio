variable "app_name" {
  type = string
}

variable "app_env" {
  type = string
}

variable "s3_site_bucket" {
  type = string
}

variable "cloudfront_distribution_id" {
  type = string
}

variable "iam_codebuild_role_arn" {
  type = string
}

variable "iam_codepipeline_role_arn" {
  type = string
}

variable "iam_lambda_codepipeline_role_arn" {
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
