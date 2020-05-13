provider "aws" {
  region = "eu-west-2"
}

data "template_file" "temp1" {
  template = "${file("/root/iam/policy.json")}"
}


resource "aws_iam_policy" "policy" {
name = "test12poli123"
description = "My test policy"
policy = "${data.template_file.temp1.rendered}"
}

