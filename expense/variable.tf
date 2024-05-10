# ec2 variables

variable "instance_name" {
  type = list
  default = ["db", "backend", "frontend"]
}

variable "image_name" {
  type = string
  default = "ami-090252cbe067a9e58"
  description = "RHEL-9 Image"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "common_tags" {
  default = {
    Project = "Expense"
    Environment = "dev"
    Terraform = "true"
  }
}

# sg variables

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

#r53 variable
variable "zone_id" {
  default = "Z03923121KRYC3VZBNNH0"
}

variable "domain_name" {
  default = "devops91.cloud"
}