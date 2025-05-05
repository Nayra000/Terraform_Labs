# resource "aws_key_pair" "ssh_key" {
#   key_name   = "my-key"
#   public_key = file("../keys/my-key.pub") 
# }



resource "aws_instance" "bastion" {
  ami           = "ami-0e449927258d45bc4" 
  instance_type = "t2.micro"             
  subnet_id     = aws_subnet.public_subnet1.id
  vpc_security_group_ids = [
    aws_security_group.allow_ssh_anywhere.id
  ]
  # key_name = aws_key_pair.ssh_key. key_name

  tags = {
    Name = "Bastion-Host"
  }
}

resource "aws_instance" "application" {
  ami           = "ami-0e449927258d45bc4" 
  instance_type = "t2.micro"             
  subnet_id     = aws_subnet.private_subnet1.id
  vpc_security_group_ids = [
    aws_security_group.allow_ssh_and_3000_vpc.id
  ]
  # key_name = aws_key_pair.ssh_key. key_name

  tags = {
    Name = "Application-Host"
  }
}

