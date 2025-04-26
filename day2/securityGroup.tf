resource "aws_security_group" "allow_ssh_anywhere" {
  name        = "allow-ssh-anywhere"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description = "Allow SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ssh-anywhere"
  }
}

resource "aws_security_group" "allow_ssh_and_3000_vpc" {
  name        = "allow-ssh-and-3000-vpc"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description = "Allow SSH from VPC CIDR"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.myvpc.cidr_block]
  }

  ingress {
    description = "Allow port 3000 from VPC CIDR"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.myvpc.cidr_block]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ssh-and-3000-vpc"
  }
}

resource "aws_security_group" "rds_sg" {
  name = "Allow MySQL Access from VPC"
  vpc_id  = aws_vpc.myvpc.id

  ingress {
    description = "Allow 3306 access from VPC CIDR"
    protocol    = "tcp"
    from_port   = 3306
    to_port     = 3306
    cidr_blocks = ["10.0.0.0/16"]  
  }
   egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow MySQL Access from VPC"
  }
}


resource "aws_security_group" "redis_sg" {
  name = "Allow Redis Access from VPC"
  vpc_id = aws_vpc.myvpc.id

  ingress {
    protocol    = "tcp"
    from_port   = 6379
    to_port     = 6379
    cidr_blocks = ["10.0.0.0/16"] 
  }

  egress {
    description = "Allow all outbound traffic"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Allow Redis Access from VPC"
  }
}
