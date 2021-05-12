resource "aws_route_table" "prv_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Project = "sdn-tutorial"
  }
}

resource "aws_route_table_association" "prv_rt_assoc" {
  subnet_id      = aws_subnet.prv_sub.id
  route_table_id = aws_route_table.prv_rt.id
}
