resource "aws_nat_gateway" "clouda-commerce-nat-1a" {
  allocation_id = "eipalloc-0d34b4ab51c7e4721" #putting directly existing eip allocation ID since new EIP's can't create due to limits
  subnet_id     = aws_subnet.clouda-commerce-public-us-east-1a.id

  tags = {
    Name = "clouda-commerce-nat-1a"
  }
  #depends_on = [aws_internet_gateway.igw] dosent need since it's already there
  depends_on = [aws_subnet.clouda-commerce-public-us-east-1a]
}

/* resource "aws_nat_gateway" "clouda-commerce-nat-1b" {
  allocation_id = "eipalloc-0d34b4ab51c7e4721" #putting directly existing eip allocation ID since new EIP's can't create due to limits
  subnet_id = aws_subnet.clouda-commerce-public-us-east-1b.id

  tags = {
    Name = "clouda-commerce-nat-1b"
  }
  #depends_on = [aws_internet_gateway.igw] dosent need since it's already there
  depends_on =[aws_subnet.clouda-commerce-public-us-east-1b]
} */