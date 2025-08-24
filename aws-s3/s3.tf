provider "aws" {
  region = "us-east-1"

}

// creating a S3 bucket
resource "aws_s3_bucket" "testing_bucket" {
        bucket = "testing-bucket-by-terraform"

    } 

// upploading a file to the S3 bucket
resource "aws_s3_object" "uploading_bucket" {
     bucket = aws_s3_bucket.testing-bucket-by-terraform.bucket
     source = "./hello.txt"
     key   = "mydata.txt"
}
