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

variable "ami_id" {
  description = "Optional AMI ID override (leave empty to use latest Ubuntu AMI dynamically)."
  type        = string
  default     = "" # empty means 'use data.aws_ami.ubuntu.id'
}


variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "public_key_path" {
  description = "Path to the public key for SSH access"
  type        = string
}

variable "private_key_path" {
  description = "Path to the private key for SSH access"
  type        = string
  default     = "ssh-keys/dove-key" 
}

variable "webuser" {
  description = "user for SSH access"
  type        = string
  default     = "ubuntu"
}

variable "script_source" {
  description = "The source path for the web app script"
  type        = string
  default     = "modules/web-app/web.sh"
}

variable "script_destination" {
  description = "The destination path on the instance"
  type        = string
  default     = "/tmp/web.sh"
}

variable "remote_exec_commands" {
  description = "Commands to execute on the remote instance"
  type        = list(string)
  default     = [
    "chmod +x /tmp/web.sh",
    "sudo /tmp/web.sh"
  ]
}
