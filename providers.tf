terraform {
  cloud {
    organization = "tm2entity"

    workspaces {
      name = "terra-house-1"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.19.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
  # Configuration options for the AWS provider
}
