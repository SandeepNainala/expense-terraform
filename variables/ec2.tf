resource "aws_instance" "db" {
  ami           = var.image_name
  instance_type = var.instance_type
  # left side things are called as arguments, right side are values.
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = var.tags
}

resource "aws_security_group" "allow_ssh" {
  name        = var.sg_name
  description = var.sg_description

  ingress {
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = var.protocol
    cidr_blocks      = var.allow_cidr
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # -1  all protocols
    cidr_blocks      = var.allow_cidr
  }

  tags = {
    Name = "allow_ssh"
    CreatedBy = "Sandeep"
  }
}