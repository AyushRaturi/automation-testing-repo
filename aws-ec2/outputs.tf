output "aws_instance_public_ip" {
  value = aws_instance.TerraformEC2.public_ip
}

output "aws_instance_region" {
  value = aws_instance.TerraformEC2.region
}