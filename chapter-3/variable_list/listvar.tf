variable "list_var1" {
  type="list"
  default=["user1","user2","user3"]
}

output "user_name" {
  value="${var.list_var1[2]}"
}
