resource "aws_instance" "db" {
    ami = "ami-0b4f379183e5706b9"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-006bc654442a8a0cc"]
    tags = {
        Name = "db"
    }
}