variable "instance_name" {
  type = map
  default = {
    db = "t2.micro"
    backend = "t2.small"
    frontend = "t2.micro"
  }
}

variable "common_tags" {
  type = map
  default = {
    Project = "expense"
    Terraform = "true"
  }
}


variable "domain_name" {
  default = "devops91.cloud"
}

variable "zone_id" {
  default = "Z03923121KRYC3VZBNNH0"
}