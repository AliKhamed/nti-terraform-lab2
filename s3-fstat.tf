resource "aws_s3_bucket" "nti-s3" {
  bucket = var.s3-bucket["bucket-name"]

  tags = {
    Name = var.s3-bucket["s3-tag-name"]
  }
}
resource "aws_s3_bucket_versioning" "nti-s3-versioning" {
  bucket = aws_s3_bucket.nti-s3.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "nti-dynamodb-table" {
  name         = "terraformFstatFile"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"


  attribute {
    name = "LockID"
    type = "S"
  }
}

# terraform {
#   backend "s3" {
#     bucket = var.s3-bucket["bucket-name"]
#     key    = "state/terraform.tfstate"
#     region = "us-east-1"
#     dynamodb = "terraformFstatFile"
#   }
# }














