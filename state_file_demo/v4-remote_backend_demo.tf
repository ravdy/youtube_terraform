terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "< 5.0"
    }
  }

    backend "s3" {
    # Replace this with your bucket name!
    bucket         = "valaxy-terraform-state-file"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
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
resource "aws_s3_bucket" "terraform_state" {
  bucket = "valaxy-terraform-state-file"

  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = true
  }
}
