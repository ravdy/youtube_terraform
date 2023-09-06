terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "< 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "amazon-server" {
  ami           = "ami-051f7e7f6c2f40dc1"
  instance_type = "t2.micro"
  tags = {
    Name = "demo-server"
  }
}
