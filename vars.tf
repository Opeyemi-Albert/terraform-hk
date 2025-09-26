variable "region" {
  description = "AWS region where resources will be created"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "ami_id" {
  description = "Optional AMI ID override (leave empty to use latest Ubuntu AMI dynamically)."
  type        = string
  default     = "" # empty means 'use data.aws_ami.ubuntu.id'
}


variable "instance_type" {
  description = "EC2 instance type (e.g., t2.micro)"
  type        = string
  default     = "t2.micro"
}

variable "public_key_path" {
  description = "Path to the public key for SSH access"
  type        = string
}
