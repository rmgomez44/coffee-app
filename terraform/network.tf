# create the VPC
resource "aws_vpc" "Coffee_VPC" {
  cidr_block           = var.vpcCIDRblock
  instance_tenancy     = var.instanceTenancy 
  enable_dns_support   = var.dnsSupport 
  enable_dns_hostnames = var.dnsHostNames
    tags = {
        Name = "coffee-app-lab"
    }
} 

# Create the Public Subnets
resource "aws_subnet" "Public_Subnet1" {
  vpc_id                  = aws_vpc.Coffee_VPC.id
  cidr_block              = var.publicSubnet1
  map_public_ip_on_launch = var.mapPublicIP 
  availability_zone       = var.availabilityZone1
tags = {
   Name = "Public-subnet1"
}
}
resource "aws_subnet" "Public_Subnet2" {
  vpc_id                  = aws_vpc.Coffee_VPC.id
  cidr_block              = var.publicSubnet2
  map_public_ip_on_launch = var.mapPublicIP 
  availability_zone       = var.availabilityZone2
tags = {
   Name = "Public_subnet2"
}
}

resource "aws_subnet" "Private_Subnet1" {
  vpc_id                  = aws_vpc.Coffee_VPC.id
  cidr_block              = var.privateSubnet1
  map_public_ip_on_launch = var.mapPublicIP 
  availability_zone       = var.availabilityZone1
tags = {
   Name = "Private-subnet1"
}
}

resource "aws_subnet" "Private_Subnet2" {
  vpc_id                  = aws_vpc.Coffee_VPC.id
  cidr_block              = var.privateSubnet2
  map_public_ip_on_launch = var.mapPublicIP 
  availability_zone       = var.availabilityZone2
tags = {
   Name = "Private-subnet2"
}
}

resource "aws_subnet" "Private_Subnet3" {
  vpc_id                  = aws_vpc.Coffee_VPC.id
  cidr_block              = var.privateSubnet3
  map_public_ip_on_launch = var.mapPublicIP 
  availability_zone       = var.availabilityZone1
tags = {
   Name = "Private-subnet3-RDS"
}
}

resource "aws_subnet" "Private_Subnet4" {
  vpc_id                  = aws_vpc.Coffee_VPC.id
  cidr_block              = var.privateSubnet3
  map_public_ip_on_launch = var.mapPublicIP 
  availability_zone       = var.availabilityZone2
tags = {
   Name = "Private-subnet4"
}
}



# Create the Internet Gateway
resource "aws_internet_gateway" "Coffee_VPC_GW" {
 vpc_id = aws_vpc.Coffee_VPC.id
 tags = {
        Name = "My VPC Internet Gateway"
}
} 

# Create the Route Table
resource "aws_route_table" "Coffee_VPC_route_table" {
 vpc_id = aws_vpc.Coffee_VPC.id
 tags = {
        Name = "My VPC Route Table"
}
} 

# Create the Internet Access
resource "aws_route" "Coffee_VPC_internet_access" {
  route_table_id         = aws_route_table.Coffee_VPC_route_table.id
  destination_cidr_block = var.destinationCIDRblock
  gateway_id             = aws_internet_gateway.Coffee_VPC_GW.id
} 

# Associate the Route Table with the Subnet
resource "aws_route_table_association" "Public_Subnet1_association" {
  subnet_id      = aws_subnet.Public_Subnet1.id
  route_table_id = aws_route_table.Coffee_VPC_route_table.id
} 

resource "aws_route_table_association" "Public_Subnet2_association" {
  subnet_id      = aws_subnet.Public_Subnet2.id
  route_table_id = aws_route_table.Coffee_VPC_route_table.id
}