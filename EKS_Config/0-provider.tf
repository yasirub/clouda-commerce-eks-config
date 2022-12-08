provider "aws" {
  region = "us-east-1"
}

variable "vpc_id" {
  default = "vpc-0f0511db5cfb1df14"
}

variable "cluster_name" {
  default = "Clouda-Commerce"
}

variable "cluster_version" {
  default = "1.22"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
