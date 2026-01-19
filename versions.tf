terraform {
  cloud {
    organization = "SuhaniOrg"
    workspaces {
      name = "First_Docker_Project"
    }
  }
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}