variable "image_name" {
  type = string
  default = "ami-090252cbe067a9e58"
  description = "RHEL-9 Image"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "tags" {
  default = {
    Project = "Expense"
    Environment = "dev"
    Name = "DB"
  }
}

variable "sg_name" {
  default = "allow_ssh"
}

variable "sg_description" {
  default = "Allow SSH traffic port 22"
}

variable "ssh_port" {
  default = 22
}

variable "protocol" {
  default = "tcp"
}

variable "allow_cidr" {
  default = ["0.0.0.0/0"]
  type = list
}