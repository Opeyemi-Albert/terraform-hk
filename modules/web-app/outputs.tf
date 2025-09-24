# modules/web-app/outputs.tf

output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_instance_ip" {
  description = "Public IP of the Public EC2 Instance"
  value       = aws_instance.public.public_ip
}

output "private_instance_ip" {
  description = "Private IP of the Private EC2 Instance"
  value       = aws_instance.private.private_ip
}

output "public_sg_id" {
  value = aws_security_group.public_sg.id
}

output "private_sg_id" {
  value = aws_security_group.private_sg.id
}
