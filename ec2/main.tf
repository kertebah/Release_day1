resource "aws_security_group" "ec2_sg" {
  name   = "ec2-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.sg_rds_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2" {
  ami                         = "ami-0c55b159cbfafe1f0" # Amazon Linux 2
  instance_type               = "t2.micro"
  subnet_id                   = var.public_subnet
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true
  tags = {
    Name = "Public-EC2"
  }
}
