# 
# CodeBuild
# 

resource "aws_iam_role" "codebuild_role" {
  name               = "${var.app_name}-${var.app_env}-codebuild-role"
  assume_role_policy = data.aws_iam_policy_document.codebuild_assume_role_policy.json
}

resource "aws_iam_role_policy" "codebuild_policy" {
  name = "${var.app_name}-${var.app_env}-codebuild-policy"

  role   = aws_iam_role.codebuild_role.id
  policy = data.aws_iam_policy_document.codebuild_policy.json
}

# 
# CodePipeline
# 

resource "aws_iam_role" "codepipeline_role" {
  name               = "${var.app_name}-${var.app_env}-codepipeline-role"
  assume_role_policy = data.aws_iam_policy_document.codepipeline_assume_role_policy.json
}

resource "aws_iam_role_policy" "codepipeline_policy" {
  name = "${var.app_name}-${var.app_env}-codepipeline-policy"

  role   = aws_iam_role.codepipeline_role.id
  policy = data.aws_iam_policy_document.codepipeline_policy.json
}

# 
# Lambda for CodePipeline
# 

resource "aws_iam_role" "lambda_codepipeline_role" {
  name               = "${var.app_name}-${var.app_env}-lambda-codepipeline-role"
  assume_role_policy = data.aws_iam_policy_document.lambda_codepipeline_assume_role_policy.json
}

resource "aws_iam_policy" "cloudfront_invalidation" {
  name        = "CloudFrontInvalidationPolicy"
  path        = "/"
  description = "IAM policy for CloudFront invalidation by Lambda"

  policy = data.aws_iam_policy_document.cloudfront_invalidation_policy.json
}

resource "aws_iam_role_policy_attachment" "lambda_codepipeline_attachment" {
  role       = aws_iam_role.lambda_codepipeline_role.name
  policy_arn = aws_iam_policy.cloudfront_invalidation.arn
}
