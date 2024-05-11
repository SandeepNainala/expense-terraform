resource "aws_instance" "db" {
  ami           = ami-090252cbe067a9e58
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_ports.id]

  tags = {
    Name = "db"
  }
}

