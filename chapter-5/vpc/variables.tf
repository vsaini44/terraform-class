variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_1" {
  default = "10.0.1.0/24"
}
variable "private_1" {
  default = "10.0.100.0/24"
}

variable "public_2" {
  default = "10.0.2.0/24"
}
variable "private_2" {
  default = "10.0.200.0/24"
}

variable "ami" {
  default = "ami-0470e33cd681b2476"
}

variable "key_path" {
  default = "public_key"
}

