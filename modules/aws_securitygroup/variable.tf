variable "sg_name" {
  description = "Name of security group"
  default     = "The default sg name"
}

variable "sg_description" {
  description = "Description of security group"
  default     = "the default sg description"
}

variable "vpc_id" {

}

variable "vpc_cidr_secure" {
  
}

variable "allow_ports_public" {

  description = "List of ports to open for server"
  type        = list(any)
  default     = ["80", "443"]
}

variable "allow_ports_secure" {
  description = "List of ports to open for secure connection"
  type        = list(any)
  default     = []
}

variable "common_tags" {
  description = "Common tags to all resourses"
  type        = map(any)
  default = {
    Owner       = "Vadim Aleksandrovich"
    YouTube     = "From 18 lesson"
    Environment = "development"
  }
}