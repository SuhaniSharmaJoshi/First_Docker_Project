provider "aws" {
    region = var.aws_region
}

resource "aws_instance" "Docker_EC2" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.web.id]
    subnet_id = data.aws_subnets.default.id

    tags = {
      Name = var.instance_name
    }
}

data "aws_vpc" "default" {
    default = true
  
}

data "aws_subnets" "default" {
    filter {
      name = "vpc-id"
      values = [ data.aws_vpc.default.id ]
    }
  
}

resource "aws_security_group" "web" {
    name = "web-sg"
    description = "Allow HTTP and SSH"
    vpc_id = data.aws_vpc.default.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]

    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]

    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

