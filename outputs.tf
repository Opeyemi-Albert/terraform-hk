# root/outputs.tf

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.web-app.vpc_id
}

output "public_instance_ip" {
  description = "The ID of the public EC2 instance"
  value       = module.web-app.public_instance_ip
}

output "private_instance_ip" {
  description = "The ID of the private EC2 instance"
  value       = module.web-app.private_instance_ip
}

output "public_sg_id" {
  description = "The ID of the public security group"
  value       = module.web-app.public_sg_id
}

output "private_sg_id" {
  description = "The ID of the private security group"
  value       = module.web-app.private_sg_id
}

