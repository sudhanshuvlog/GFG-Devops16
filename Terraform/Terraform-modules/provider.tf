terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.37.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region     = "ap-south-1"
#   access_key = "my-access-key"
#   secret_key = "my-secret-key"
profile = "default"
}