# count controls the looping, so we limit the number of availability zones by changing the value of availability_zones. 
resource "aws_subnet" "public-subnet" {
  vpc_id            = "${aws_vpc.main.id}"
  count             = "${length("${data.aws_availability_zones.available.names}") >= "${var.availability_zones}" ?  "${var.availability_zones}" : "${length("${data.aws_availability_zones.available.names}")}"}"
  cidr_block        = "${cidrsubnet("${lookup(var.vpc_networks, var.aws_region)}", 10, count.index)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

  tags {
    Name      = "Public Subnet ${count.index}"
    Terraform = "true"
  }
}

resource "aws_route_table_association" "public" {
  count          = "${length("${data.aws_availability_zones.available.names}") >= "${var.availability_zones}" ?  "${var.availability_zones}" : "${length("${data.aws_availability_zones.available.names}")}"}"
  subnet_id      = "${element(aws_subnet.public-subnet.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.public.*.id, count.index)}"
}

