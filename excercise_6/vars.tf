variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"

}

variable "ZONE2" {
  default = "us-east-1b"

}

variable "ZONE3" {
  default = "us-east-1c"

}


variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0ebfd941bbafe70c6"
    us-west-1 = "ami-047d7c33f6e7b4bc4"
  }

}

variable "USER" {
  default = "ec2-user"

}


variable "PUBLIC_KEY" {
  default = "terra-key-3.pub"
}

variable "PRIVATE_KEY" {
  default = "terra-key-3"
}

variable "MYIP" {
  default = "175.157.13.0/32"
}