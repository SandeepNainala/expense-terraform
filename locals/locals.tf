locals {
  ami_id = "ami-090252cbe067a9e58"
  instance_type = "t2.micro"
  sg_id = "sg-052d406550420b45d"
  tags = {
    name = "db"
  }
}