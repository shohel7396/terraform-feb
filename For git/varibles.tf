variable "os" {
  type        = string
  default     = "ami-0ebf411a80b6b22cb"   
  description = "AMI ID for the EC2 instance"
}

variable "Size" {
  type        = string
  default     = "t3.micro"                
  description = "Instance type for the EC2 instance"
}

variable "name" {
  type        = string
  default     = "terraform-variables"               
  description = "Name tag for the EC2 instance"
}

variable "bucketname" {
  type        = string
  default     = "devops-demo-bucket-terraformawstest"
  description = "Unique S3 bucket name"
}