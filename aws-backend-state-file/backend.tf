terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
          }
    }
// This backend configuration is for storing the Terraform state file in an S3 bucket name "testingbucketbyayush-1" in the "ap-south-1" region.
    backend "s3" {
        bucket = "testingbucketbyayush-1"
        key    = "terraform.tfstate"
        region = "ap-south-1"
    }
}

provider "aws" {
    region = "ap-south-1"
}

// creating a EC2 instance 
resource "aws_instance" "TerraformEC2" {
    
    ami = "ami-0f918f7e67a3323f0"
    instance_type = "t2.micro"
    tags = {
        Name = "TerraformEC2"
    }
}