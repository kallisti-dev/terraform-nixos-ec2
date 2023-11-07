resource "aws_eip" "prod_app" {
  instance = aws_instance.prod_app.id
  domain = "vpc"
}
resource "aws_eip_association" "public_app_ip_association" {
  allocation_id = aws_eip.prod_app.id
  instance_id   = aws_instance.prod_app.id
}
