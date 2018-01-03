output "subnet_ids" {
    value = ["${aws_subnet.public-subnet.*.id}"]
} 
