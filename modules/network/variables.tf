variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "eu-west-2"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}
variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "AWS availability zone"
  type        = string
}

variable "image_id" {
    description = "The ID of the machine image (AMI) to use for the server."
    type = map(string)
    default = {
        "eu-west-1" = "ami-0bc691261a82b32bc"
        "eu-west-2" = "ami-046c2381f11878233"
    }
}

# Instances
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "public_key_path" {
  description = "Path to the public key for SSH access"
  type        = string
}
