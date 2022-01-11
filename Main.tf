# configure VPC
resource "aws_vpc" "P9-VPC" {
  cidr_block       = var.VPC_CIDR
  instance_tenancy = "default"

  tags = {
    Name = "P9-VPC"
  }
}

# configure Public SN
  #Public SN1
resource "aws_subnet" "P9-PubSN1" {
 vpc_id     = aws_vpc.P9-VPC.id
 cidr_block = var.PSN1_Var
 availability_zone = "eu-west-1a"
  tags = {
    Name = "P9-PubSN1"
  }
}
#Public SN2
resource "aws_subnet" "P9-PubSN2" {
  vpc_id     = aws_vpc.P9-VPC.id
  cidr_block = var.PSN2_Var
  availability_zone = "eu-west-1b"
  tags = {
    Name = "P9-PubSN2"
  }
}

# configure Private SN
  #Private SN1
resource "aws_subnet" "P9-PrivSN1" {
 vpc_id     = aws_vpc.P9-VPC.id
 cidr_block = var.PRSN1_Var
 availability_zone = "eu-west-1c"
  tags = {
    Name = "P9-PrivSN1"
  }
}
#Private SN2
resource "aws_subnet" "P9-PrivSN2" {
 vpc_id     = aws_vpc.P9-VPC.id
 cidr_block = var.PRSN2_Var
 availability_zone = "eu-west-1a"
  tags = {
    Name = "P9-PrivSN2"
  }
}

# configure the Internet Gateway
resource "aws_internet_gateway" "P9-IGW" {
  vpc_id = aws_vpc.P9-VPC.id

  tags = {
    Name = "P9-IGW"
  }
}

#configure the RouteTable
 #Private RT
resource "aws_route_table" "P9-PriRT" {
  vpc_id = aws_vpc.P9-VPC.id
    route = []
  tags = {
    Name = "P9-PriRT"
  }
}


 #Public RT
resource "aws_route_table" "P9-PubRT" {
  vpc_id = aws_vpc.P9-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.P9-IGW.id
  }
}

#Configure Route Table Association
#RTA1
resource "aws_route_table_association" "P9-PriRT-Asso1" {
  subnet_id      = aws_subnet.P9-PrivSN1.id
  route_table_id = aws_route_table.P9-PriRT.id
}
#RTA2
resource "aws_route_table_association" "P9-PriRT-Asso2" {
  subnet_id      = aws_subnet.P9-PrivSN2.id
  route_table_id = aws_route_table.P9-PriRT.id
}

#Configure the Internet Gateway Association
 resource "aws_route" "IGW-ass-pub-RT" {
  route_table_id            = aws_route_table.P9-PubRT.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.P9-IGW.id
 }