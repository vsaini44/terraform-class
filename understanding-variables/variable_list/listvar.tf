variable "list_var1" {
  type="list"
}

output "user_name" {
  value="${var.list_var1[2]}"
}
