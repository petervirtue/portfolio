data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/invalidate_cache.py"
  output_path = "${path.module}/lambda_function.zip"
}
