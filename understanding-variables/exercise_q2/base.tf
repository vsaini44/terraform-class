#Question : Deploy aws ec2 in different region using the maps
######################


variable "region" {}

variable "ec2_ami" {
  type="map"
  default={
    ap-south-1="ami-0470e33cd681b2476"
    ap-southeast-1="ami-0ec225b5e01ccb706"
}
}


provider "aws" {
  region = "${var.region}"
}


resource "aws_instance"  "inst1" {
  ami = "${lookup(var.ec2_ami,var.region)}"
  instance_type = "t2.micro"
}


