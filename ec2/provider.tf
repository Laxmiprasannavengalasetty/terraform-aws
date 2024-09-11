terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.6.6"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-01"
}