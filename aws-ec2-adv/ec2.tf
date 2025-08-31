#login key paint for the EC2 instances


resource "aws_key_pair" "my_key" {
  key_name   = "Terra-testing-key"
  public_key = file("Terra-testing-key.pub")                      #File(public_key) function to access the public key file
}

#VPC , Subnet & Security group for the EC2 instances

resource "aws_default_vpc" "VPC" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "SG" {
  name        = "Terra-SG"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_default_vpc.VPC.id

tags = {  
  Name = "Terra-SG"
}     

# inbound rules 
ingress {
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
    description       = "Allow SSH inbound traffic"
}

ingress {
    from_port         = 80
    to_port           = 80
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
    description       = "Allow HTTP inbound traffic"
}

  # outbound rules
  egress {
    from_port         = 0
    to_port           = 0
    protocol          = "-1"
    cidr_blocks       = ["0.0.0.0/0"]
    description       = "Allow all outbound traffic"
  }

}



# EC2 instance 

resource "aws_instance" "Terra-ec2" {

  key_name = aws_key_pair.my_key.key_name
  security_groups = [ aws_security_group.SG.name ]            #function
  ami = var.ec2_instance                                      #accutal value on variable.tf file
  instance_type = "t2.micro"

  
    root_block_device {
      volume_size = var.ec2_root_storage_size                 #string interpolation with variables 
      volume_type = "gp3"
    }
    tags = {
      Name = "Terra-ec2-adv"
    }

}