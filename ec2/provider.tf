terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-01"
}
resource "aws_vpc" "terraform-vpc" {
  cidr_block = "10.0.0.0/16"
}
