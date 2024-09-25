variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"

}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0ebfd941bbafe70c6"
    us-west-1 = "ami-047d7c33f6e7b4bc4"
  }

}