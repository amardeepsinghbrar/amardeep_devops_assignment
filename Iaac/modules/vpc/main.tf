
# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = merge(
    var.tags,
    {
      Name = "${var.environment}_${var.vpc_name}"
    }
  )
}

# Create public subnets
resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.cidr_public_subnet1
  availability_zone       = var.az1
  map_public_ip_on_launch = true
  tags = merge(
    var.tags,
    {
      Name = "${var.vpc_name}_public_subnet1"
    }
  )
}

resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.cidr_public_subnet2
  availability_zone       = var.az2
  map_public_ip_on_launch = true
  tags = merge(
    var.tags,
    {
      Name = "${var.vpc_name}_public_subnet2"
    }
  )
}

# Create private subnets
resource "aws_subnet" "private_subnet1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.cidr_private_subnet1
  availability_zone       = var.az1
  tags = merge(
    var.tags,
    {
      Name = "${var.vpc_name}_private_subnet1"
    }
  )
}

resource "aws_subnet" "private_subnet2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.cidr_private_subnet2
  availability_zone       = var.az2
  tags = merge(
    var.tags,
    {
      Name = "${var.vpc_name}_private_subnet2"
    }
  )
}

# Create internet gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
}

# Create route table for public subnets
resource "aws_route_table" "public_route_table1" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = merge(
    var.tags,
    {
      Name = "${var.vpc_name}_public_route_table1"
    }
  )
}
resource "aws_route_table" "public_route_table2" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = merge(
    var.tags,
    {
      Name = "${var.vpc_name}_public_route_table2"
    }
  )
}

# Associate public subnets with the public route table
resource "aws_route_table_association" "public_subnet1_association" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_route_table1.id
}

resource "aws_route_table_association" "public_subnet2_association" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_route_table2.id
}

# Create NAT gateway and route table for private subnets
resource "aws_eip" "nat-gateway-eip" {
  vpc = true
}
resource "aws_nat_gateway" "my_nat_gateway" {
  depends_on = [ aws_eip.nat-gateway-eip ]

  allocation_id = aws_eip.nat-gateway-eip.id
  subnet_id     = aws_subnet.public_subnet1.id
  tags = {
    Name = "${var.vpc_name}-nat-gateway"
  }
}

resource "aws_route_table" "private_route_table1" {
  depends_on = [ aws_nat_gateway.my_nat_gateway ]
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my_nat_gateway.id
  }
  tags = merge(
    var.tags,
    {
      Name = "${var.vpc_name}_private_route_table1"
    }
  )
}
resource "aws_route_table" "private_route_table2" {
  depends_on = [ aws_nat_gateway.my_nat_gateway ]
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my_nat_gateway.id
  }
  tags = merge(
    var.tags,
    {
      Name = "${var.vpc_name}_private_route_table2"
    }
  )
}

# Associate private subnets with the private route table
resource "aws_route_table_association" "private_subnet1_association" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_route_table1.id
}

resource "aws_route_table_association" "private_subnet2_association" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_route_table2.id
}



