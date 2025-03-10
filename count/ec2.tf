# resource <resource-type> <resource-name>
resource "aws_instance" "db" {
  #count = 3
  count = length(var.instance_names)   # length of the list of instance_names variable is assigned to count variable to create multiple instances based on the list of instance_names variable
  ami = "ami-090252cbe067a9e58"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = {
    Name = var.instance_names[count.index]  # count.index is used to get the index of the list of instance_names variable to assign the name to the instance
  }
}

resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  description = "allowing SSH access"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0 # from 0 to 0 means, opening all protocols
    to_port          = 0
    protocol         = "-1" # -1 all protocols
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
    CreatedBy = "Sandeep"
  }
}