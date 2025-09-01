output "ec2_public_ip" { #for outputting the public IP
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.Terra-ec2.public_ip
}

output "ec2_public_dns" { #for outputting the public DNS
  description = "The public DNS name of the EC2 instance"
  value       = aws_instance.Terra-ec2.public_dns
}


output "ec2_private_ip" { #for outputting the private IP
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.Terra-ec2.private_ip
}

output "ec2_private_dns" { #for outputting the private DNS
  description = "The private DNS name of the EC2 instance"
  value       = aws_instance.Terra-ec2.private_dns
}