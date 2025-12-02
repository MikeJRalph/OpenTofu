terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.23.0"
    }
  }
}

provider "aws" {
  region = "af-south-1"
}

module "my_bucket" {
  source = "./s3-bucket"
  bucket_name = "toasty-wheels-of-steel-bucket"
  tags = {
    Environment = "dev"
  }
}

output "s3_bucket_arn" {
  value = module.my_bucket.bucket_arn
}