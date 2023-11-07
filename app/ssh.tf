
locals {
  ssh_key_name = "aws_rsa"
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
}

resource "local_sensitive_file" "pem" {
  filename        = pathexpand("~/.ssh/${local.ssh_key_name}.pem")
  file_permission = "400"
  content         = tls_private_key.ssh_key.private_key_pem
}

resource "aws_key_pair" "ssh_key" {
  key_name   = local.ssh_key_name
  public_key = tls_private_key.ssh_key.public_key_openssh
}
