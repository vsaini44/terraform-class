variable "map_var1" {
  type="map"
  default={
    val1="delhi"
    val2="mumbai"
  }
}

output "total_map" {
  value="${var.map_var1}"
}

output "city_name" {
  value="${var.map_var1.val1}"
}

