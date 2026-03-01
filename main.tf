terraform {
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "6.32.1"
        }
    }
}
provider "aws"{
    region = "us-east-1"
}

resource "aws_instance" "text" {
    ami = "ami-0f3caa1cf4417e51b"
    instance_type = "t3.micro"
}