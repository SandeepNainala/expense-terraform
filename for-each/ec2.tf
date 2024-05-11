resource "aws_instance" "expense" {
  for_each =  var.instance_name
  ami           = data.aws_ami.ami_info.id
  instance_type = each.value
  # left side things are called as arguments, right side are values.
  vpc_security_group_ids = ["sg-052d406550420b45d"]

  tags = merge(
    var.common_tags,
    {
      Name = each.key
      Module = each.key
    }
  )
