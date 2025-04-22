/*resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow MySQL from EC2"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.sg_ec2_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "main" {
  name       = "main-db-subnet-group"
  subnet_ids = [var.private_subnet]
}

resource "aws_db_instance" "rds" {
  identifier              = "mydb"
  allocated_storage       = 20
  engine                  = "mysql"
  instance_class          = "db.t2.micro"
  username                = "admin"
  password                = "password123"
  skip_final_snapshot     = true
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.main.name

  depends_on = [aws_security_group.rds_sg, aws_db_subnet_group.main]
}
*/