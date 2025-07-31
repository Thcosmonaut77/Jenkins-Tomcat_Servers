variable "my_ip" {
  description = "My IP address"
  type = string
  sensitive = true
}

variable "region" {
  description = "Defines the region where AWS service is provisioned"
  default = "us-east-1"
}