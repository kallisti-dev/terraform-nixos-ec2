variable "bucket" {
    type = string
    nullable = false
    description = "Name of the S3 bucket to create for Terraform backend"
}

variable "region" {
    type = string
    nullable = false
    description = "Name of the AWS region where Terraform backend should be created"
}
