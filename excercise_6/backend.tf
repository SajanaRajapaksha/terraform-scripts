terraform {
  backend "s3" {
    bucket = "terraform-state-9-26"
    key    = "terraform/backend_excercise_6"
    region = "us-east-1"
  }
}