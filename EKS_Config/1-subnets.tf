resource "aws_subnet" "clouda-commerce-private-us-east-1a" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.192.0/20"
  availability_zone = "us-east-1a"

  tags = {
    "Name"                                      = "clouda-commerce-private-us-east-1a"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "clouda-commerce-private-us-east-1b" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.208.0/20"
  availability_zone = "us-east-1b"

  tags = {
    "Name"                                      = "clouda-commerce-private-us-east-1b"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "clouda-commerce-public-us-east-1a" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.224.0/20"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    "Name"                                      = "clouda-commerce-public-us-east-1a"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "clouda-commerce-public-us-east-1b" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.240.0/20"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    "Name"                                      = "clouda-commerce-public-us-east-1b"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}
