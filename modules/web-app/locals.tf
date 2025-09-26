locals {
  final_ami = var.ami_id != "" ? var.ami_id : data.aws_ami.ubuntu.id
}

