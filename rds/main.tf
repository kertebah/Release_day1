resource "aws_db_subnet_group" "main" {
  name       = "main-db-subnet-group"
  subnet_ids = var.private_subnets
}

/*resource "aws_db_instance" "rds" {
  identifier              = "mydb"
  allocated_storage       = 20
  engine                  = "mysql"
  instance_class          = "db.t3.micro"
  username                = "admin"
  password                = "password123"
  skip_final_snapshot     = true
  vpc_security_group_ids  = [var.sg_id]
  db_subnet_group_name    = aws_db_subnet_group.main.name
}
*/