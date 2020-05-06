#QUESTION1: Create a basic aws EC2 instance using terraform with name as "instance_student_id"
####################


#SOLUTION:
####################
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance"  "inst1" {
  ami = "ami-0470e33cd681b2476"
  instance_type = "t2.micro"
  tags = {
    Name="instance_student_id"
}
}
