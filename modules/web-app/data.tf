# AMI Data Source to get the latest Ubuntu AMI ID
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

# Fetch available availability zones dynamically
data "aws_availability_zones" "available" {
  state = "available"
}

output "instance_id" {
  description = "AMI ID of Ubuntu instance"
  value       = data.aws_ami.ubuntu.id
}
