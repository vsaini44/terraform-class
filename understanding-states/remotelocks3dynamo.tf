provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket="vickybultibucket"
    dynamodb_table = "terraform-state-lock-dynamo"
    key    ="terraform.tfstate"
    region="ap-south-1"
  }
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  tags =  {
    Name = "DynamoDB Terraform State Lock Table"
}
}

resource "aws_instance"  "inst1" {
  ami = "ami-0470e33cd681b2476"
  instance_type = "t2.micro"
}

