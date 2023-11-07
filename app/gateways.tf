resource "aws_internet_gateway" "prod" {
  vpc_id = aws_vpc.prod.id
}
