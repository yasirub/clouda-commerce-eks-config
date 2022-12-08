terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.23.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
  registry_auth {
    address  = "your_accNo.dkr.ecr.us-east-1.amazonaws.com"
    username = "AWS"
    password = "your access token"
  }
}

provider "aws" {
  region = "us-east-1"
}
