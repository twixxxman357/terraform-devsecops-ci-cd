# Test CI pipeline execution

terraform {
  required_version = ">= 1.6.0"
}

provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_vpc" "example" {
  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "ci-cd-example-vpc"
  }
}

