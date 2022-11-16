variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "env" {
  default = "dev"
}

variable "public_subnet_cidrs" {
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"

  ]
}

# !!! No Free tier, because of the NAT Gate way

variable "private_subnet_cidrs" {
  default = [
    "10.0.11.0/24",
    "10.0.22.0/24"
  ]
}

variable "private_db_subnet_cidrs" {
  default = [
    "10.0.31.0/24",
    "10.0.32.0/24"
  ]
}