resource "aws_route_table" "clouda-commerce-private-rtb" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.clouda-commerce-nat-1a.id
  }

  tags = {
    Name = "clouda-commerce-private-rtb"
  }
}

resource "aws_route_table" "clouda-commerce-public-rtb" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-042e67013f5a6a8e9" #directly putting IGW id since it was not created using terraform
  }

  tags = {
    Name = "clouda-commerce-public-rtb"
  }
}

resource "aws_route_table_association" "clouda-commerce-private-us-east-1a" {
  subnet_id      = aws_subnet.clouda-commerce-private-us-east-1a.id
  route_table_id = aws_route_table.clouda-commerce-private-rtb.id
}

resource "aws_route_table_association" "clouda-commerce-private-us-east-1b" {
  subnet_id      = aws_subnet.clouda-commerce-private-us-east-1b.id
  route_table_id = aws_route_table.clouda-commerce-private-rtb.id
}

resource "aws_route_table_association" "clouda-commerce-public-us-east-1a" {
  subnet_id      = aws_subnet.clouda-commerce-public-us-east-1a.id
  route_table_id = aws_route_table.clouda-commerce-public-rtb.id
}

resource "aws_route_table_association" "clouda-commerce-public-us-east-1b" {
  subnet_id      = aws_subnet.clouda-commerce-public-us-east-1b.id
  route_table_id = aws_route_table.clouda-commerce-public-rtb.id
}
