resource "aws_key_pair" "ssh_key" {
  key_name   = "my-key"
  public_key = file("../keys/my-key.pub") 
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] 
}

resource "aws_instance" "bastion" {
  ami           =  data.aws_ami.ubuntu.id
  instance_type = var.instance_type            
  subnet_id     = aws_subnet.subnets["public_subnet1"].id
  vpc_security_group_ids = [
    aws_security_group.allow_ssh_anywhere.id
  ]
  key_name = aws_key_pair.ssh_key.key_name

  tags = {
    Name = "Bastion-Host"
  }
  
  # provisioner "local-exec" {
  #   command = "echo ${self.private_ip} "
    
  # }
}

resource "aws_instance" "application" {
  ami           = data.aws_ami.ubuntu.id
  instance_type =  var.instance_type         
  subnet_id     = aws_subnet.subnets["private_subnet1"].id
  vpc_security_group_ids = [
    aws_security_group.allow_ssh_and_3000_vpc.id
  ]
  key_name = aws_key_pair.ssh_key.key_name

  tags = {
    Name = "Application-Host"
  }
}

resource "null_resource" "null" {
  provisioner "local-exec" {
    command = "echo the IP of Bastion-Host is ${aws_instance.bastion.private_ip} "
  }

  depends_on = [aws_instance.bastion ,aws_key_pair.ssh_key]
  
}
