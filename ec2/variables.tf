variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet" {
  description = "ID of the public subnet"
  type        = string
}

variable "sg_rds_id" {
  description = "Security group ID of the RDS instance"
  type        = string
}
