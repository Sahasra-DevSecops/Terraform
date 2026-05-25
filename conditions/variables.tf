variable "environment" {
  default = "prod"
}
variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
  description = "RHEL 9 Image ID for AWS EC2 instance"

}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "EC2 instance type"
}

variable "ec2_tags" {
  type = map(any)
  default = {
    Name        = "conditions-demo (terraform)"
    Project     = "roboshop"
    Terraform   = "true"
    Environment = "dev"
  }
}

variable "sg_name" {
  type        = string
  default     = " allow_all_terraform"
  description = "Name for the security group"
}

variable "sg_description" {
  type        = string
  default     = "Allow TLS inbound traffic and all outbound traffic"
  description = "Description for the security group"
}
variable "sg_from_port" {
  type        = number
  default     = 0
  description = "Starting port for security group rule"
}
variable "sg_to_port" {
  type        = number
  default     = 0
  description = "Ending port for security group rule"

}
variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
variable "sg_tags" {
  type    = map(any)
  default = {}
}
