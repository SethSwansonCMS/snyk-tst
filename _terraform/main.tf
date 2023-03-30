data "aws_caller_identity" "current" {}

resource "tls_private_key" "test" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}
