output "public_ip" {
  value       = aws_instance.terraform.public_ip
  description = "This is the public ip of instance created"
  sensitive   = false
}
