resource "aws_instance" "prod_app" {
  ami             = module.nixos_image.ami
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.ssh_key.key_name
  security_groups = [aws_security_group.prod_app.id]
  subnet_id       = aws_subnet.prod_public.id
  monitoring      = true
}
