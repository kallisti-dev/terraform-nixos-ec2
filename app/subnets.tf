resource "aws_subnet" "prod_public" {
  cidr_block = cidrsubnet(aws_vpc.prod.cidr_block, 3, 1)
  vpc_id     = aws_vpc.prod.id
  #   availability_zone = "us-east-1a"
}

resource "aws_route_table" "prod_public" {
  vpc_id = aws_vpc.prod.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod.id
  }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.prod_public.id
  route_table_id = aws_route_table.prod_public.id
}
