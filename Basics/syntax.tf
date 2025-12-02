# Below is an example of the syntax for OpenTofu

# <BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>" {
#   # Block body
#   <IDENTIFIER> = <EXPRESSION> # Argument
# }

# Variable example
# variables.tf
variable "base_cidr_block" {
  type = string
  default = "10.0.0.0/8"
}


# VPC resource example
# main.tf
resource "aws_vpc" "main" {
  cidr_block = var.base_cidr_block
}