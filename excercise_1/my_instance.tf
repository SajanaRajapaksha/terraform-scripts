provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "intro" {
  ami                    = "ami-0ebfd941bbafe70c6"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "terra-key"
  vpc_security_group_ids = ["sg-0d6b2d6b4b3b43319"]
  tags = {
    Name    = "terra-instance"
    Project = "terra-learn"
  }
}