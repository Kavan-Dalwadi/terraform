resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.s3_bucket_name}-${terraform.workspace}"

  tags = {
    "Name" = "${var.env}-bucket"
  }
}

resource "aws_s3_bucket_versioning" "tf-example" {
  bucket = aws_s3_bucket.terraform_state.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "tf-example" {
  bucket = aws_s3_bucket.terraform_state.id
  acl    = "private"
}