variable "image_name" {
  type = string
  default = "ami-090252cbe067a9e58"
  description = "RHEL-9 Image"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "instance_name" {
  default = "db"
}
