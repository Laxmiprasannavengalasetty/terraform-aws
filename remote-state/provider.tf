terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.6"
    }
  }
      backend "s3"{
      bucket = "terraform-locking-s3"   # s3 bucket name
      key    = "remote-state"    #s3 key 
      region = "us-east-1"
      dynamodb_table = "terraform-lock"      #dynamodb table name
  
      }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
