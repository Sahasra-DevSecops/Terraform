resource "aws_instance" "example" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  key_name      = "MyKeyPair"

  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  #self refers to the current resource being created, in this case, the aws_instance resource. The provisioner block is used to execute a local command after the instance is created. In this case, it appends a message to a log file indicating that the EC2 instance has been created along with its public IP address.
  # provisioner "local-exec" {
  #   command = "echo 'EC2 Instance ${self.id} has been created with public IP ${self.public_ip}' >> deployment_ips.log"
  # }

  #self refers to the current resource being created, in this case, the aws_instance resource. The provisioner block is used to execute a local command after the instance is created. In this case, it writes the public IP address of the EC2 instance to a file named inventory.ini.
  provisioner "local-exec" {
    command = "echo  '${self.public_ip}' > inventory.ini"
  }
  provisioner "local-exec" {
    command    = "exit 1"
    on_failure = continue

  }
  provisioner "local-exec" {
    command = "echo  script-2"
  }
  provisioner "local-exec" {
    when    = destroy
    command = "echo 'Deleting the instance' "
  }
  provisioner "local-exec" {
    when    = destroy
    command = "echo > inventory.ini"
  }
  connection {
    type     = "ssh"
    user     = "root"
    password = "DevOps321"
    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
  }
  provisioner "remote-exec" {
    inline = [
      "sudo systemctl stop nginx"
    ]
    when = destroy
  }

  tags = {
    Name    = "provisioners_ec2-demo"
    Project = "roboshop"
  }
}
resource "aws_security_group" "allow_tls" {
  name        = "allow_all_terraform" # this is for aws account
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
