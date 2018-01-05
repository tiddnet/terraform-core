output "aws_vpc.main.id" {
  value = "${aws_vpc.main.id}"
}
output "aws_default_security_group.default.id" {
  value = "${aws_default_security_group.default.id}"
}

output "subnet_ids" {
  value = ["${aws_subnet.public-subnet.*.id}"]
}
