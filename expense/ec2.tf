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

resource "aws_security_group" "allow_ssh" {
    name        = var.sg_name
    description = var.sg_description


    ingress {
        from_port   = var.ssh_port
        to_port     = var.ssh_port
        protocol    = "tcp"
        cidr_blocks = var.allowed_cidr
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = var.allowed_cidr
    }
    tags = {
        Name   = "allow_ssh"
        CreatedBy = "Sandeep"
    }
}