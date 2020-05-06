
provider "aws" {
  region = "ap-south-1"
}


terraform {
  backend "s3" {
    bucket = "terraform-mystate-vickydata"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}


resource "aws_instance"  "inst1" {
  ami = "ami-0470e33cd681b2476"
  instance_type = "t2.micro"
}


