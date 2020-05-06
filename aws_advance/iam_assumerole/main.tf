# Utils account containing users
provider "aws" {
  profile = "utils"
  region  = "${var.region_utils}"
}

# Prod account
provider "aws" {
  profile = "prod"
  region  = "${var.region_prod}"
  alias   = "prod"
}
