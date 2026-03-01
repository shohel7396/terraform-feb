terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.10.0"
    }
  }

  backend "s3" {
    bucket = "this-istest-for-backend"      
    key    = "testestdemo.tfstate" 
    region = "us-west-2"            
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "test123" {
  ami           = "ami-055a9df0c8c9f681c"
  instance_type = "t3.micro"

  tags = {
    Name = "test123"
  }
}

output "aws_instance_public_ip" {
  value = aws_instance.test123.public_ip
}
