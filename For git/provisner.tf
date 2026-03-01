provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami                    = "ami-0ebf411a80b6b22cb" # Ubuntu
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y nginx
              systemctl start nginx
              systemctl enable nginx
              echo "Hello from Terraform user_data on Ubuntu!" > /var/www/html/index.html
              EOF

  tags = {
    Name = "terraform-nginx"
  }

  # Local-exec on creation
  provisioner "local-exec" {
    command = "echo EC2 instance ${self.id} created in Oregon >> ec2_log.txt"
  }

  # Local-exec on destroy
  provisioner "local-exec" {
    when    = destroy
    command = "echo EC2 instance ${self.id} is being destroyed >> ec2_log.txt"
  }
}

# Security Group
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP"
  vpc_id      = "vpc-0bb5282c8695b3ae3"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
