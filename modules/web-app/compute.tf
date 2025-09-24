# Public Instance
resource "aws_instance" "public" {
  ami                         = var.image_id[var.region]
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.dove_key.key_name
  vpc_security_group_ids      = [aws_security_group.public_sg.id]
  availability_zone           = var.availability_zone

  tags = { Name = "public-instance" }

  #No 1:Push the web.sh script to the public instance
  provisioner "file" {
    source      = var.script_source
    destination = var.script_destination
  }

  #No 2: Execute the script on the instance
  #Step 1: Define how to connect to the instance
  connection {
    type        = "ssh"
    user        = var.webuser
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }

  #Step 2: Run commands on the instance
  provisioner "remote-exec" {
  inline = var.remote_exec_commands
  }

}

# Private Instance
resource "aws_instance" "private" {
  ami                    = var.image_id[var.region]      # data.aws_ami.amiID.id not used here
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  key_name               = aws_key_pair.dove_key.key_name
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  availability_zone      = var.availability_zone

  tags = { Name = "private-instance" }
}
