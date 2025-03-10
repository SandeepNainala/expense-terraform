terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.48.0"
    }
  }
  backend "s3" {
    bucket = "awsd-78s-remote-state"
    key    = "expense-dymanic"
    region = "us-east-1"
    dynamodb_table = "awsd-78s-locking"
  }
}


#provide authentication here
provider "aws" {
  region = "us-east-1"
}