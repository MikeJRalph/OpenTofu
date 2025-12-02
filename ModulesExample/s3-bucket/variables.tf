variable "bucket_name" {
  description = "Name of S3 bucket"
  type = string
}

variable "tags" {
  description = "Tags for the bucket"
  type = map(string)
  default = {}
}