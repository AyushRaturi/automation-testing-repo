resource "aws_instance" "Production_instance" {
    ami = "ami-0c55b159cbfafe01e"
    instance_type = "t2.micro"
    tags = {
      Name = "ProductionInstance"
    }
}


