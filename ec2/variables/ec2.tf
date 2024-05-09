resource "aws_instance" "db" {
  ami           = var.image_name
  instance_type = var.instance_type
  # left side things are called as arguments, right side are values.
  vpc_security_group_ids = [aws_security_group.allow_ssh.]

  tags = {
    Name = "db"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH traffic"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
    CreatedBy = "Sandeep"
  }
}