resource "aws_instance" "expense" {
    count = length(var.instance_names)    # This will create multiple instances based on the length of the instance_names list in the variables.tf file
    ami = var.image_id
    vpc_security_group_ids = []
    instance_type = var.instance_names[count.index] == "db" ? "t2.small" : "t2.micro"    # This will create a t2.micro instance if the instance name is db, otherwise it will create a t2.small instance
    tags = merge(
        var.common_tags,
        {
            Name   = var.instance_names[count.index]
            Module = var.instance_names[count.index]
        }
    )
}