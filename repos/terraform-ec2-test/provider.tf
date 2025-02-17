terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.86.0"
    }
  }
  backend "s3" {
    bucket         = "daws25s-module-test"   # S3 bucket name
    key            = "key-module-test"       # Path/name for the state file
    region         = "us-east-1"             # AWS region for the S3 bucket
    dynamodb_table = "terraform-module-test" # DynamoDB table for state locking
  }
}
#provide authentication here:
provider "aws" {
  region = "us-east-1"
}