resource "aws_s3_bucket" "backend" {
    bucket = var.bucket
    force_destroy = true
}
