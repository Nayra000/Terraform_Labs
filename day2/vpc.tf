resource "aws_vpc" "myvpc" {
  cidr_block       = var.cider_block
  enable_dns_support = true
  enable_dns_hostnames = true
}