module "s3" {
  source = "../../modules/s3"

  app_name = var.app_name
  app_env  = var.app_env
}

module "cloudfront" {
  source = "../../modules/cloudfront"

  app_name = var.app_name
  app_env  = var.app_env

  s3_site_bucket_domain_name = module.s3.site_s3_bucket.bucket_domain_name
  acm_certificate_arn        = var.acm_certificate_arn
  price_class                = var.cloudfront_price_class
  whitelisted_locations      = ["US", "CA", "GB", "DE"]
}

module "iam" {
  source = "../../modules/iam"

  app_name = var.app_name
  app_env  = var.app_env

  s3_site_bucket_arn = module.s3.site_s3_bucket.arn
}

module "codedeploy" {
  source = "../../modules/codedeploy"

  app_name = var.app_name
  app_env  = var.app_env

  iam_codebuild_role_arn           = module.iam.iam_codebuild_role.arn
  iam_codepipeline_role_arn        = module.iam.iam_codepipeline_role.arn
  iam_lambda_codepipeline_role_arn = module.iam.iam_lambda_codepipeline_role.arn

  cloudfront_distribution_id = module.cloudfront.cloudfront_site_distribution.id

  github_branch = var.github_branch
  github_owner  = var.github_owner
  github_repo   = var.github_repo
  github_token  = var.github_token

  s3_site_bucket = module.s3.site_s3_bucket.bucket
}
