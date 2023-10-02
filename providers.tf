terraform {
  cloud {
    organization = "tm2entity"

    workspaces {
      name = "terra-house-1"
    }
  }

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
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

provider "random" {
  # Configuration options for the random provider
}
