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
