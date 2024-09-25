resource "aws_instance" "terra-inst-2" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "terra-key"
  vpc_security_group_ids = ["sg-0d6b2d6b4b3b43319"]
  tags = {
    Name    = "terra-instance-2"
    Project = "terra-excercise-2"
  }

}