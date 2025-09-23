# root/outputs.tf

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.network.vpc_id
}

output "public_instance_ip" {
  description = "The ID of the public EC2 instance"
  value       = module.network.public_instance_ip
}

output "private_instance_ip" {
  description = "The ID of the private EC2 instance"
  value       = module.network.private_instance_ip
}

output "public_sg_id" {
  description = "The ID of the public security group"
  value       = module.network.public_sg_id
}

output "private_sg_id" {
  description = "The ID of the private security group"
  value       = module.network.private_sg_id
}

