resource "aws_security_group" "terra_aws_sg" {
  vpc_id      = aws_vpc.terra.id
  name        = "terra_vpc_aws_sg"
  description = "security group for terra vpc"

  ingress {
    from_port   = 22 //allow ssh from my ip
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
  }
  //outbound traffic
  egress {
    from_port   = 0 //from all the ports
    to_port     = 0 //from all the ports
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] //to anywhere
  }

  tags = {
    Name = "Allow-ssh"
  }
}