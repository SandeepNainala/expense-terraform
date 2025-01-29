resource "aws_instance" "db" {
  ami = var.image_id
  instance_type = var.instance_name == "db" ? "t3.small" : "t3.micro" # Conditional expression to set instance type based on instance name variable value
}