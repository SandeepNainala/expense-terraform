resource "aws_instance" "db" {
  ami          = local.ami_id
  instance_type = var.instance_type == "db" ? "t3.small" : "t3.micro"
  vpc_security_group_ids = local.sg_id
  tags = local.tags
}
