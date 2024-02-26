resource "aws_vpc" "myvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "mygfgvpc"
  }
}
resource "aws_subnet" "mygfgsubnet" {
  vpc_id     = aws_vpc.myvpc.id #argument refrencing
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "gfgsubnetpublic"
  }
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "myigw"
  }
}

resource "aws_route_table" "myrt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }

  tags = {
    Name = "mygfgroutetable"
  }
}


resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.mygfgsubnet.id
  route_table_id = aws_route_table.myrt.id
}