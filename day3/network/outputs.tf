output subnets {
  value       = aws_subnet.subnets
}

output vpc_id {
  value       = aws_vpc.myvpc.id
}

output ssh_sg {
  value       = aws_security_group.allow_ssh_anywhere.id
}


output app_sg {
  value       = aws_security_group.allow_ssh_and_3000_vpc.id
}

