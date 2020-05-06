#QUESTION: Create the instance with name "inst2-studentid" passed in a variable
#####################


provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance"  "inst1" {
  ami = "ami-0470e33cd681b2476"
  instance_type = "t2.micro"
  tags = {
    Name="${var.var1}"
}
}

variable "var1" {
  type="string"
  default="inst2-studentid"
}


