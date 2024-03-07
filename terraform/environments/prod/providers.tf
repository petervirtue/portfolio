terraform {
  # NOTE - May want to adjust this in the future
  required_version = "1.7.4"
}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}
