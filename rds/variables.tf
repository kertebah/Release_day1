variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnet" {
  description = "ID of the private subnet"
  type        = string
}

variable "sg_ec2_id" {
  description = "Security group ID of the EC2 instance"
  type        = string
}

