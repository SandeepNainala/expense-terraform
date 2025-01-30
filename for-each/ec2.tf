resource "aws_instance" "db" {
    for_each = var.instance_names   # for_each loop to create multiple instances with different names and tags each time
    ami = data.aws_ami.ami_info.id
    vpc_security_group_ids = ["sg-006bc654442a8a0cc"]
    instance_type = each.value
    tags = merge(
        var.common_tags,
        {
            Name = each.key
            Module = each.key
        }
    )
}