module "nixos_image" {
  source  = "git::https://github.com/tweag/terraform-nixos.git//aws_image_nixos?ref=5f5a0408b299874d6a29d1271e9bffeee4c9ca71"
  release = "20.09"
}

module "deploy_nixos" {
  source               = "git::https://github.com/tweag/terraform-nixos.git//deploy_nixos?ref=5f5a0408b299874d6a29d1271e9bffeee4c9ca71"
  nixos_config         = "${path.module}/configuration.nix"
  target_host          = aws_eip.prod_app.public_ip
  ssh_private_key_file = local_sensitive_file.pem.filename
  ssh_agent            = false
}
