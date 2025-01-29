# ec2 variables

variable "instance_names" {
    description = "The name of the instance"
    default = [ "db", "frontend", "backend" ]
    type = list(string)

}

variable "image_id" {
    description = "The AMI to use for the server"
    default = "ami-0c55b159cbfafe1f0"
    type = string
}

variable "instance_type" {
    description = "The type of instance to use"
    default = "t2.micro"
    type = string
}

variable "common_tags" {
    description = "A map of tags to add to all resources"
    default = {
        Project = "Expenses"
        Environment = "Dev"
        Terraform = "true"
    }
    type = map(string)
}