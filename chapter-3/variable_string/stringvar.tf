variable "var1" {
  type=string
}

variable "var2" {
  type=string  
}

output "ov1" {
  value="${var.var1}"
}

output "ov2" {
  value="${var.var2}"
}

