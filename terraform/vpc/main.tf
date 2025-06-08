provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket         = "ramsy007"  # Use a globally unique name
    key            = "vpcactions/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "github-actions-vpc"
  }
}
