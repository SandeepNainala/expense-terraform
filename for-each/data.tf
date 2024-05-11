data "aws_ami" "ami_info" {
  most_recent = true

  owners = ["973714476881"]
  filters{
    name= "name"
    value = "RHEL-9-DevOps-Practice"
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}