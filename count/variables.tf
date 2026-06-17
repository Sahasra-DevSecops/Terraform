variable "instances_name" {
  type        = list(any)
  default     = ["Frontend", "Cart", "Payment", "Shipping", "User", "Mysql", "Redis", "Mongodb", "Rabbitmq", "Catalogue"]
  description = "RHEL 9 Image ID for AWS EC2 instance"

}

variable "zone_id" {
  type        = string
  default     = "Z09891872RAM18EYN37Z5"
  description = "Route53 zone id"
}
variable "domain_name" {
  type        = string
  default     = "www.cart.online"
  description = "Route53 domain name"
}
variable "fruits" {
  type    = list(string)
  default = ["apple", "banana", "apple", "orange"]
}

variable "fruits_set" {
  type    = set(string)
  default = ["apple", "banana", "apple", "orange"]
}
