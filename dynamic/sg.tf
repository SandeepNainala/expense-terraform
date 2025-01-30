resource "aws_security_group" "allow_ports" {
  name = "allow_ports"
  description = "allowing 22,80,8080,3306 access"

  #terraform block
  dynamic "ingress" {
    for_each = var.inbound_rules  # for_each is a loop, which will loop through the list of maps in the variable inbound_rules
    content{       # content block is used to define the attributes of the resource block inside the dynamic block
      from_port        = ingress.value["port"] # ingress is a map, so we are accessing the value of the map using ingress.value and then accessing the port key
      to_port          = ingress.value["port"]
      protocol         = ingress.value["protocol"]
      cidr_blocks      = ingress.value["allowed_cidr"]
    }
  }

  egress {
    from_port        = 0 # from 0 to 0 means, opening all protocols
    to_port          = 0
    protocol         = "-1" # -1 all protocols
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ports"
  }
}