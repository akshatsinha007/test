provider "aws" {
    region = "us-east-2"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true

}

resource "aws_s3_bucket" "example" {
  bucket = "terraform-bucket-02"

  tags = {
    Name        = "Bucket By BADAL"
    Environment = "USING TERRAFORM"
  }
}
