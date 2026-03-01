<<<<<<< HEAD

terraform {
  required_providers {
    aws = {
     source = "hashicorp/aws"
     version = "6.11.0"
    }
  }
}

  provider "aws"{
    region = "us-west-2"
  }

resource "aws_s3_bucket" "demo" {
bucket = "morningclasstestdemo"
  
}
=======

terraform {
  required_providers {
    aws = {
     source = "hashicorp/aws"
     version = "6.11.0"
    }
  }
}

  provider "aws"{
    region = "us-west-2"
  }

resource "aws_s3_bucket" "demo" {
bucket = "morningclasstestdemo"
  
}
>>>>>>> fe882981614ffdb64e9f55158317a38d3127ad0b
