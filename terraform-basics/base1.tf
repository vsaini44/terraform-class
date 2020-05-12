provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "res1" {
  ami= "ami-01a6e31ac994bbc09"
  instance_type = "t2.micro"
  tags = {
    Name = "vishal-instance"
  }
}


resource "aws_instance" "res2" {
  ami= "ami-01a6e31ac994bbc09"
  instance_type = "t2.micro"
  tags = {
    Name = "kunal-instance"
}
}  
