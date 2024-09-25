resource "aws_key_pair" "terra-key-3-aws" {
  key_name   = "terra-key-3-aws"
  public_key = file("terra-key-3.pub")
}

resource "aws_instance" "terra-inst-3" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.terra-key-3-aws.key_name
  vpc_security_group_ids = ["sg-0d6b2d6b4b3b43319"]
  tags = {
    Name    = "terra-inst-3"
    Project = "terra-excercise-3"
  }

  //pass the file to instance
  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  //connect or login to the instance
  connection {
    user        = var.USER
    private_key = file("terra-key-3")
    host        = self.public_ip //use public ip of the instance to login
  }

  //remote execution of web.sh
  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

}

