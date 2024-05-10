locals {
  ami_id = "ami-090252cbe067a9e58"
  instance_type = var.instance_type == "db" ? "t3.small" : "t3.micro"
  sg_id = "sg-052d406550420b45d"
  tags = {
    name = "db"
  }
}