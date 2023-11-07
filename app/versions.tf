terraform {
    backend "s3" {
        key = "app.tfstate"
    }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.6.2"
    }
  }
  required_version = ">= 0.14"
}