provider "aws" {
  region = "us-east-1"
  
}

// creating a EC2 instance

resource "aws_instance" "TerraformEC2" {
    
    ami = "ami-0f918f7e67a3323f0"
    instance_type = "t2.micro"
    tags = {
        Name = "TerraformEC2"
    }
}   