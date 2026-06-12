resource "aws_instance" "example" {
  count = 10
  # ami                    = var.ami_id
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"

  #instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  #tags                   = var.ec2_tags
  tags = {
    Name        = var.instances_name[count.index]
    Project     = "roboshop"
    Terraform   = "true"
    Environment = "dev"
  }
}
resource "aws_security_group" "allow_tls" {
  name        = "allow_all_roboshop" # this is for aws account
  description = "Allow TLS inbound traffic and all outbound traffic"
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_all_terraform"
  }
}
