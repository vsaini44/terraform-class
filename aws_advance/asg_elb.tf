provider "aws" {
  region="ap-south-1"
}

resource "aws_security_group" "sg" {
name = "sg1"
ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
}
}

resource "aws_launch_configuration" "lc1" {
  image_id = "ami-0470e33cd681b2476"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.sg.id}"]
  user_data = <<-EOF

        #!/bin/bash
        yum install httpd -y
        echo "hello there asg" > /var/www/html/index.html
        systemclt enable httpd
        systemctl start httpd
        EOF
   lifecycle  {
     create_before_destroy = true
}
}


data "aws_availability_zones" "all" {}

resource "aws_autoscaling_group" "asg1" {
  launch_configuration = "${aws_launch_configuration.lc1.id}"
  availability_zones = ["ap-south-1a","ap-south-1b","ap-south-1c"]
  min_size = 2
  max_size = 10
  load_balancers = ["${aws_elb.lb1.name}"]
  health_check_type = "ELB"
  tag  {
    key = "Name"
    value = "terraform-asg-example"
    propagate_at_launch = true
}
}

resource "aws_elb" "lb1" {
  name ="lb1"
  security_groups = ["${aws_security_group.sg.id}"]
  availability_zones = ["ap-south-1a","ap-south-1b","ap-south-1c"]
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 5
    interval = 10
    target = "HTTP:80/"
}
listener {
  lb_port = "80"
  lb_protocol = "http"
  instance_port = "80"
  instance_protocol = "http"
