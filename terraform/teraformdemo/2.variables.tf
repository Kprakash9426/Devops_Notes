variable "aws_region" {
  description = "The AWS region to deploy resources into"
  type        = string
}

variable "environment" {
  description = "Application environment name used for tagging"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the custom VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "instance_type" {
  description = "The size of the EC2 instance"
  type        = string
}