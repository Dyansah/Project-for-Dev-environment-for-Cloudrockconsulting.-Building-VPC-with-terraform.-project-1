# MY VPC
resource "aws_vpc" "dya-vpc" {
  cidr_block       = var.cidr-for-vpc
  instance_tenancy = "default"

  tags = {
    Name = "dya-vpc"
  }
}

# Private Sub 1
resource "aws_subnet" "Private-sub1" {
  vpc_id     = aws_vpc.dya-vpc.id
  cidr_block = var.cidr-for-Private-sub1
  availability_zone = var.AZ-1

  tags = {
    Name = "Private-sub1"
  }
}

# Private Sub 2
resource "aws_subnet" "Private-sub2" {
  vpc_id     = aws_vpc.dya-vpc.id
  cidr_block = var.cidr-for-Private-sub2
  availability_zone = var.AZ-1

  tags = {
    Name = "Private-sub2"
  }
}


# Public Sub 1
resource "aws_subnet" "Public-sub1" {
  vpc_id     = aws_vpc.dya-vpc.id
  cidr_block = var.cidr-for-Public-sub1
  availability_zone = var.AZ-1

  tags = {
    Name = "Public-sub1"
  }
}


# Public Sub 2
resource "aws_subnet" "Public-sub2" {
  vpc_id     = aws_vpc.dya-vpc.id
  cidr_block = var.cidr-for-Public-sub2
  availability_zone = var.AZ-1

  tags = {
    Name = "Public-sub2"
  }
}


# Private Route Table
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.dya-vpc.id

  tags = {
    Name = "private-route-table"
  }
}

# Public Route Table
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.dya-vpc.id

  tags = {
    Name = "public-route-table"
  }
}

# Private Route Association

resource "aws_route_table_association" "private-route-table1" {
  subnet_id      = aws_subnet.Private-sub1.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-route-table2" {
  subnet_id      = aws_subnet.Private-sub2.id
  route_table_id = aws_route_table.private-route-table.id
}

# Public Route Association

resource "aws_route_table_association" "public-route-table1" {
  subnet_id      = aws_subnet.Public-sub1.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "public-route-table2" {
  subnet_id      = aws_subnet.Public-sub2.id
  route_table_id = aws_route_table.public-route-table.id
}


# Internet Gateway

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.dya-vpc.id

  tags = {
    Name = "IGW"
  }
}


# AWS Route

resource "aws_route" "public-igw-route" {
  route_table_id            = aws_route_table.public-route-table.id
  gateway_id               = aws_internet_gateway.IGW.id
  destination_cidr_block    = "0.0.0.0/0"
}

