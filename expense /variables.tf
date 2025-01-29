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

# security group variables

variable "sg_name" {
    description = "The name of the security group"
    default = "sg_name"
    type = string
}

variable "sg_description" {
    description = "The description of the security group"
    default = "sg_description"
    type = string
}

variable "ssh_port" {
    description = "The port to allow SSH traffic on"
    default = 22
    type = number
}

variable "allowed_cidr" {
    description = "The port to allow HTTP traffic on"
    default = ["0.0.0.0/0"]
    type = list(string)
}

# route53 variables
variable "domain_name" {
    description = "The domain name to use for the Route53 zone"
    default = "devops91.cloud"
    type = string
}

variable "zone_id" {
    description = "The ID of the Route53 zone"
    default = "Z0689449WJZKR124Q6OZ"
    type = string
}