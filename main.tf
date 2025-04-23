provider "aws" {
  region = var.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.0"
}

module "networking" {
  source = "./networking"
  region = var.region
}

resource "aws_security_group" "ec2_sg" {
  name   = "ec2-sg"
  vpc_id = module.networking.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "rds_sg" {
  name   = "rds-sg"
  vpc_id = module.networking.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "ec2" {
  source        = "./ec2"
  vpc_id        = module.networking.vpc_id
  public_subnet = module.networking.public_subnet
  sg_id         = aws_security_group.ec2_sg.id
}

module "rds" {
  source         = "./rds"
  vpc_id         = module.networking.vpc_id
  private_subnet = module.networking.private_subnet
  sg_id          = aws_security_group.rds_sg.id
}
