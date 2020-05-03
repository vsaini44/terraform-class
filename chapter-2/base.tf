provider "aws" {
  region = "ap-south-1"
  access_key = "AKIAQOXY4XFEVBHUKKVE"
  secret_key = "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"
}

resource "aws_instance"  "inst1" {
  ami = "ami-0470e33cd681b2476"
  instance_type = "t2.micro"
}


#resource "aws_instance"  "inst2" {
#  ami = "ami-0470e33cd681b2476"
#  instance_type = "t2.micro"
# }
