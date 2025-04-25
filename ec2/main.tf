resource "aws_instance" "ec2" {
  ami                    = "ami-02018c46119b25ffe"
  instance_type          = "t2.micro"
  subnet_id              = var.public_subnet
  vpc_security_group_ids = [var.sg_id]
  associate_public_ip_address = true
}


##ggggggg
