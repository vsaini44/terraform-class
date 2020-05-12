variable "mymap" {
 type=map
 default = {
   city1="paris"
   city2="berlin"
   city3="newyork"
}
}

variable "cityno" {
  validation {
    condition = can(regex("city1|city2|city3", var.cityno))
    error_message = "Please input i12132133 the correct value."
}
}

output "ov1" {
  value = "${lookup(var.mymap, var.cityno)}"
}

terraform {
  experiments = [variable_validation]
}


~      
