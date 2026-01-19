variable "aws_region" {
    description = "AWS region"
    type = string
  
}
variable "ami_id" {
    description = "AMI ID for EC2"
    type = string
}
variable "instance_type" {
    description = "EC2 instance type"
    type = string
  
}
variable "instance_name" {
    description = "EC2 instance name"
    type = string
  
}
variable "key_name" {
    description = "Key for SSH"
    type = string
  
}
