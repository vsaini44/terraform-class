provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "default" {
  key_name = "mumbai"
  public_key = "${file("${var.key_path}")}"
}

resource "aws_instance" "wb" {
   ami  = "${var.ami}"
   instance_type = "t2.micro"
   key_name = "${aws_key_pair.default.id}"
   subnet_id = "${aws_subnet.public-subnet1.id}"
   vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
   associate_public_ip_address = true
   source_dest_check = false
   user_data = "${file("userdata.sh")}"
  tags = {
    Name = "webserver"
  }
}

