resource "aws_vpc" "terra" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    tags = {
      Name = "vprofile"
    }
  }

resource "aws_subnet" "terra-pub-subnet-1" {
  vpc_id = aws_vpc.terra.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true" // if you launch instances in this subnet it will have public ip
  availability_zone = var.ZONE1
  tags = {
      Name = "terra-pub-subnet-1"
    }
}

resource "aws_subnet" "terra-pub-subnet-2" {
  vpc_id = aws_vpc.terra.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true" // if you launch instances in this subnet it will have public ip
  availability_zone = var.ZONE2
  tags = {
      Name = "terra-pub-subnet-2"
    }
}

resource "aws_subnet" "terra-pub-subnet-3" {
  vpc_id = aws_vpc.terra.id
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = "true" // if you launch instances in this subnet it will have public ip
  availability_zone = var.ZONE3
  tags = {
      Name = "terra-pub-subnet-3"
    }
}


resource "aws_subnet" "terra-priv-subnet-1" {
  vpc_id = aws_vpc.terra.id
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = "true" // if you launch instances in this subnet it will have public ip
  availability_zone = var.ZONE1
  tags = {
      Name = "terra-priv-subnet-1"
    }
}

resource "aws_subnet" "terra-priv-subnet-2" {
  vpc_id = aws_vpc.terra.id
  cidr_block = "10.0.5.0/24"
  map_public_ip_on_launch = "true" // if you launch instances in this subnet it will have public ip
  availability_zone = var.ZONE1
  tags = {
      Name = "terra-priv-subnet-2"
    }
}


resource "aws_subnet" "terra-priv-subnet-3" {
  vpc_id = aws_vpc.terra.id
  cidr_block = "10.0.6.0/24"
  map_public_ip_on_launch = "true" // if you launch instances in this subnet it will have public ip
  availability_zone = var.ZONE1
  tags = {
      Name = "terra-priv-subnet-3"
    }
}

//internet gateway
resource "aws_internet_gateway" "terra-aws_internet_gateway" {
    vpc_id = aws_vpc.terra.id
    tags = {
      Name = "terra-aws_internet_gateway"
    }
  
}


resource "aws_route_table" "terra-pub-route-table" {
  vpc_id = aws_vpc.terra.id

  route {
    cidr_block = "0.0.0.0/0" //any ip address can be routed to the internet gateway, route all the traffics to te internet gateway
    gateway_id = aws_internet_gateway.terra-aws_internet_gateway.id
  }

  tags = {
    Name = "terra-pub-route-table"
  }
}

//create route table associationsfor each subnet
resource "aws_route_table_association" "terra-pub-subnet-1-a" {
  subnet_id      = aws_subnet.terra-pub-subnet-1
  route_table_id = aws_route_table.terra-pub-route-table.id
}

resource "aws_route_table_association" "terra-pub-subnet-2-a" {
  subnet_id      = aws_subnet.terra-pub-subnet-2
  route_table_id = aws_route_table.terra-pub-route-table.id
}

resource "aws_route_table_association" "terra-pub-subnet-3-a" {
  subnet_id      = aws_subnet.terra-pub-subnet-3
  route_table_id = aws_route_table.terra-pub-route-table.id
}