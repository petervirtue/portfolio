output "iam_codebuild_role" {
  value = aws_iam_role.codebuild_role
}

output "iam_codepipeline_role" {
  value = aws_iam_role.codepipeline_role
}

output "iam_lambda_codepipeline_role" {
  value = aws_iam_role.lambda_codepipeline_role
}
