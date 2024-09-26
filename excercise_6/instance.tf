resource "aws_key_pair" "terra-key-3-aws" {
  key_name   = "terra-key-3-aws"
  public_key = file(var.PUBLIC_KEY)
}

resource "aws_instance" "terra-inst-6-web" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.terra-pub-subnet-1.id
  key_name               = aws_key_pair.terra-key-3-aws.key_name
  vpc_security_group_ids = [aws_security_group.terra_aws_sg.id]
  tags = {
    Name    = "terra-inst-6-web"
    Project = "terra-excercise-6-web"
  }

  #   //pass the file to instance
  #   provisioner "file" {
  #     source      = "web.sh"
  #     destination = "/tmp/web.sh"
  #   }

  #   //connect or login to the instance
  #   connection {
  #     user        = var.USER
  #     private_key = file("terra-key-3")
  #     host        = self.public_ip //use public ip of the instance to login
  #   }

  #   //remote execution of web.sh
  #   provisioner "remote-exec" {
  #     inline = [
  #       "chmod u+x /tmp/web.sh",
  #       "sudo /tmp/web.sh"
  #     ]
  #   }
}

//create ebs volume for instance
resource "aws_ebs_volume" "vol_terra_inst_6" {
  availability_zone = var.ZONE1
  size              = 3
  tags = {
    Name = "vol_terra_inst_6"
  }
}

//attach volume to instance
resource "aws_volume_attachment" "atach_vol_terra_inst_6" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol_terra_inst_6.id
  instance_id = aws_instance.terra-inst-6-web.id
}

//output
output "public_ip" {
  value = aws_instance.terra-inst-6-web.public_ip
}
