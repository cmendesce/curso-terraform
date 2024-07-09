data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

resource "aws_security_group" "allow_ssh" {
  name   = "allow ssh traffic"
  vpc_id = var.vpc_id

  ingress {
    from_port   = local.ssh_port
    to_port     = local.ssh_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "nginx" {
  instance_type = lookup(var.instance_types, terraform.workspace)
  ami           = data.aws_ami.ubuntu.id

  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.allow_web.id]
  subnet_id = var.subnet_ids[0]

  tags = {
    "Name" = "nginx"
    "Env" = var.env
    "Workspace" = terraform.workspace
  }

  user_data = <<-EOF
    #!/bin/bash
    set -ex
    sudo apt-get -y update
    sudo apt-get -y install nginx
    sudo service nginx start
  EOF
}
