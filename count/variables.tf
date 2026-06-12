variable "instances_name" {
  type        = list(any)
  default     = ["Frontend", "Cart", "Payment", "Shipping", "User", "Mysql", "Redis", "Mongodb", "Rabbitmq", "Catalogue"]
  description = "RHEL 9 Image ID for AWS EC2 instance"

}



