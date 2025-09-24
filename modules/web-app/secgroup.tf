# Security Group for Public Instance (Allows SSH & HTTP, HTTPS from Anywhere)
resource "aws_security_group" "public_sg" {
  name        = "public_sg"
  description = "Allow inbound traffic and all outbound traffic for public instances"
  vpc_id      = aws_vpc.main.id

  tags = { Name = "public_sg" }
}
    # Ingress: Allow HTTPS (443) from anywhere
resource "aws_vpc_security_group_ingress_rule" "public_sg_https_ipv4" {
  security_group_id = aws_security_group.public_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}
    # Ingress: Allow HTTP (80) from anywhere
resource "aws_vpc_security_group_ingress_rule" "public_sg_http_ipv4" {
  security_group_id = aws_security_group.public_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}
    # Ingress: Allow SSH (22) from anywhere
resource "aws_vpc_security_group_ingress_rule" "public_sg_ssh_ipv4" {
  security_group_id = aws_security_group.public_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

    # Egress: Allow all outbound traffic (IPv4)
resource "aws_vpc_security_group_egress_rule" "public_sg_all_ipv4" {
  security_group_id = aws_security_group.public_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

    # Egress: Allow all outbound traffic (IPv6)
resource "aws_vpc_security_group_egress_rule" "public_sg_egress_all_ipv6" {
  security_group_id = aws_security_group.public_sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}

# Security Group for Private Instance (Allows Only Internal Access)
resource "aws_security_group" "private_sg" {
  name        = "private_sg"
  description = "Allow inbound traffic and all outbound traffic for private instances"
  vpc_id      = aws_vpc.main.id

  tags = { Name = "private_sg" }
}
        # Ingress (SSH from Public SG → Private SG)
resource "aws_vpc_security_group_ingress_rule" "private_sg_ssh_from_public_sg" {
  security_group_id            = aws_security_group.private_sg.id
  referenced_security_group_id = aws_security_group.public_sg.id
  from_port                    = 22
  ip_protocol                  = "tcp"
  to_port                      = 22
}

    # Egress (Allow all outbound IPV4)
resource "aws_vpc_security_group_egress_rule" "private_sg_all_outbound" {
  security_group_id = aws_security_group.private_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# Egress (Allow all outbound IPv6)
resource "aws_vpc_security_group_egress_rule" "private_sg_all_outbound_ipv6" {
  security_group_id = aws_security_group.private_sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}

