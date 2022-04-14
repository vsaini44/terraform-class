resource "aws_instance" "res1" {
  ami = "ami-04893cdb768d0f9ee"
  instance_type = "t2.micro"
  key_name = "vishal-key"
  vpc_security_group_ids = [aws_security_group.res2.id]
  tags = {
    Name = "mycustomeprovision-instance1"
  }
  provisioner "file" {
    source      = "/root/vicky.txt"
    destination = "/home/ec2-user/vishal.txt"
  }
  connection {
    type     = "ssh"
    host = self.public_ip
    user     = "ec2-user"
    private_key = file("/root/provision/vishal.pem")
  }
}

resource "aws_security_group" "res2" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  }
  ]
}
