resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-private-subnet"
  subnet_ids = [aws_subnet.subnets["private_subnet1"].id, aws_subnet.subnets["private_subnet2"].id]
}


resource "aws_db_instance" "rds" {
  engine            =  var.db_engine
  identifier        =  var.db_identifier
  instance_class    =  var.db_instance_class
  allocated_storage =  var.db_allocated_storage
  db_name           =  var.db_name
  username          =  var.db_username
  password          =  var.db_password
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  publicly_accessible    = false  
  skip_final_snapshot    = true   
}