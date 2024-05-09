resource "aws_instance" "db" {
  ami           = var.image_name
  instance_type = var.instance_type == db ? "t2.small" : "t3.medium"
}
