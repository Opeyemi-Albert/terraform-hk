# Create a VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr

  tags = { Name = "main-vpc" }
}

# Public Subnet (With Auto-Assign Public IP)
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = { Name = "public-subnet" }
}

# Internet Gateway (For Public Instance to Have Internet)
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = { Name = "main-igw" }
}

# Route table for public subnet and associate with IGW
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = { Name = "public-rt" }
}

# Associate Public Subnet with Public Route Table
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# ───── Private Subnet ─────
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = { Name = "private-subnet" }
}

# ───── NAT Gateway for private subnet ─────
resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id

  tags = { Name = "nat-gateway" }

  depends_on = [aws_internet_gateway.igw]
}

# Route table for private subnet and associate with NAT Gateway
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = { Name = "private-rt" }
}

# Associate Private Subnet with Private Route Table
resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
