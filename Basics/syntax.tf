# Below is an example of the syntax for OpenTofu

# <BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>" {
#   # Block body
#   <IDENTIFIER> = <EXPRESSION> # Argument
# }

# Provider block
# providers.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.23.0"
    }
  }
}

provider "aws" {
  region = "af-south-1"
}

# Resource block
# main.tf
resource "aws_vpc" "main" {
  cidr_block = var.base_cidr_block
}

# Variable block
# variables.tf
variable "base_cidr_block" {
  type    = string
  default = "10.0.0.0/8"
}

# Output block
# outputs.tf
output "name" {
  description = "Output block"
  value       = var.base_cidr_block
}

# Data block 
# data.tf
data "aws_s3_bucket" "selected" {
  bucket = "bucket.test.com"
}

data "aws_route53_zone" "test_zone" {
  name = "test.com."
}

# data use example
resource "aws_route53_record" "example" {
  zone_id = data.aws_route53_zone.test_zone.id
  name    = "bucket"
  type    = "A"

  alias {
    name                   = data.aws_s3_bucket.selected.website_domain
    zone_id                = data.aws_s3_bucket.selected.hosted_zone_id
    evaluate_target_health = true
  }
}