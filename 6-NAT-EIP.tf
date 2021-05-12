resource "aws_eip" "nat_eip" {
  vpc = true

  tags = {
    Project = "sdn-tutorial"
  }
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.pub_sub.id

  tags = {
    Project = "sdn-tutorial"
  }
}
