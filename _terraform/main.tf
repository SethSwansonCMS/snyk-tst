data "aws_caller_identity" "current" {}

resource "tls_private_key" "test" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "aws_security_group" "snyk_tst" {
  name = "snyk_tst"
  description = "Triggering snyk"

  ingress = [ {
    cidr_blocks = []
    description = "EVERYTHING"
    from_port = 0
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    protocol = -1
    security_groups = []
    self = false
    to_port = 0
  } ]
}

