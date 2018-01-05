resource "aws_instance" "jump_box" {
  ami           = "${data.aws_ami.bastion-green.id}"
  instance_type = "t2.medium"
  key_name      = "terraform-test-2"

  vpc_security_group_ids = [
    "${element(aws_security_group.home-network-sg.*.id, 0)}",
    "${aws_default_security_group.default.id}",
  ]

  subnet_id                   = "${element(aws_subnet.public-subnet.*.id, 0)}"
  associate_public_ip_address = true

  root_block_device {
    volume_size = 20
    volume_type = "standard"
  }

  user_data = <<-EOF
                                #!/bin/bash
                                service docker start 
                                EOF

  tags {
    Name = "bastion-green"
  }

}

resource "aws_security_group" "jump_box_sg" {
  name        = "allow-ssh-from-jumphost"
  description = "Allow SSH from the jump host"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${aws_instance.jump_box.private_ip}/32"]
  }

  revoke_rules_on_delete = true
}

resource "aws_security_group" "home-network-sg" {
  name        = "allow-ssh-from-home"
  description = "Allow SSH from home network"
  vpc_id      = "${aws_vpc.main.id}"

  # Allow all outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["70.42.150.228/32", "144.121.140.150/32"]
  }

  revoke_rules_on_delete = true
}

output "jump-box-details" {
  value = "${aws_instance.jump_box.private_ip} - ${aws_instance.jump_box.id} - ${aws_instance.jump_box.availability_zone}"
}
