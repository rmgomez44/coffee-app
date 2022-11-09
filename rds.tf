resource "aws_db_subnet_group" "coffee-rds-db" {
  name       = "dbCoffeeGroup"
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
  name                 = "coffee-web-db"
  username             = var.rds_admin_user
  password             = var.rds_admin_pass
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}


