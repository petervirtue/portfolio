# 
# CodeBuild
# 

resource "aws_codebuild_project" "build" {
  name          = "${var.app_name}-${var.app_env}-build-project"
  description   = "Build project for portfolio site"
  build_timeout = "5"

  artifacts {
    type = "CODEPIPELINE"
  }

  cache {
    type = "NO_CACHE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "al2/standard/5.0"
    type         = "LINUX_CONTAINER"
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = "buildspec.yml"
  }

  service_role = var.iam_codebuild_role_arn
}

# 
# Lambda for CodePipeline
# 

resource "aws_lambda_function" "cloudfront_invalidate_cache" {
  function_name = "${title(var.app_name)}${title(var.app_env)}CloudFrontInvalidation"
  handler       = "index.lambda_handler"
  runtime       = "python3.8"
  role          = var.iam_lambda_codepipeline_role_arn

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  environment {
    variables = {
      DISTRIBUTION_ID = var.cloudfront_distribution_id
    }
  }
}

# 
# CodePipeline
# 

resource "aws_codepipeline" "pipeline" {
  name     = "${var.app_name}-${var.app_env}-deployment-pipeline"
  role_arn = var.iam_codepipeline_role_arn

  artifact_store {
    location = var.s3_site_bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "GitHub_Source"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        Owner      = var.github_owner
        Repo       = var.github_repo
        Branch     = var.github_branch
        OAuthToken = var.github_token
      }
    }
  }

  stage {
    name = "Build"
    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = {
        ProjectName = aws_codebuild_project.build.name
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "S3_Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "S3"
      input_artifacts = ["build_output"]
      version         = "1"

      configuration = {
        BucketName = var.s3_site_bucket
        Extract    = "true"
      }
    }

    action {
      name      = "Invalidate_CloudFront"
      category  = "Invoke"
      owner     = "AWS"
      provider  = "Lambda"
      version   = "1"
      run_order = 2


      configuration = {
        FunctionName   = aws_lambda_function.cloudfront_invalidate_cache.arn,
        UserParameters = "{\"DistributionId\":\"${var.cloudfront_distribution_id}\"}"
      }
    }
  }
}
