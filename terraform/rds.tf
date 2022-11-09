resource "aws_db_subnet_group" "coffee-rds-db" {
  name       = "db_coffee_group"
  subnet_ids = [aws_subnet.Private_Subnet3.id, aws_subnet.Private_Subnet4.id]

  tags = {
    Name = "db-coffee-group"
  }
}


resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  db_name              = "coffee-db-app"
  username             = var.rds_admin_user
  password             = var.rds_admin_pass
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = aws_db_subnet_group.coffee-rds-db.name
  skip_final_snapshot  = true
}


