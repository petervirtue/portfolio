# 
# CodeBuild
# 

data "aws_iam_policy_document" "codebuild_assume_role_policy" {
  version = "2012-10-17"

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "codebuild_policy" {
  version = "2012-10-17"

  statement {
    effect = "Allow"

    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:ListBucket",
    ]

    resources = [
      "${var.s3_site_bucket_arn}",
      "${var.s3_site_bucket_arn}/*",
    ]
  }

  statement {
    effect    = "Allow"
    actions   = ["logs:CreateLogGroup"]
    resources = ["arn:aws:logs:*:*:*"]
  }

  statement {
    effect    = "Allow"
    actions   = ["logs:CreateLogStream"]
    resources = ["arn:aws:logs:*:*:log-group:/aws/codebuild/*"]
  }

  statement {
    effect    = "Allow"
    actions   = ["logs:PutLogEvents"]
    resources = ["arn:aws:logs:*:*:log-group:/aws/codebuild/*:log-stream:*"]
  }
}

# 
# CodePipeline
# 

data "aws_iam_policy_document" "codepipeline_assume_role_policy" {
  version = "2012-10-17"

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "codepipeline_policy" {
  version = "2012-10-17"

  statement {
    effect = "Allow"

    actions = [
      "s3:*",
      "cloudfront:CreateInvalidation",
      "codebuild:StartBuild",
      "codebuild:BatchGetBuilds",
      "lambda:InvokeFunction",
    ]

    resources = ["*"]
  }
}

# 
# Lambda for CodePipeline
# 

data "aws_iam_policy_document" "lambda_codepipeline_assume_role_policy" {
  version = "2012-10-17"

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "cloudfront_invalidation_policy" {
  version = "2012-10-17"

  statement {
    effect    = "Allow"
    actions   = ["cloudfront:CreateInvalidation"]
    resources = ["*"]
  }
}

