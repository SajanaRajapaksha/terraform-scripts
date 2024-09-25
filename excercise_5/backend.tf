terraform {
  backend "s3" {
    bucket = "terra-ex5-tfstate"
    key = "terraform/backend"
    region = "us-east-1"
  }
}