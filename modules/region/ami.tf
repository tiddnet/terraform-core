
data "aws_ami" "bastion-green" {
  most_recent = true

  filter {
    name   = "tag:Product"
    values = ["bastion"]
  }

  filter {
    name   = "tag:Color"
    values = ["Green"]
  }

  owners = ["self"] # Canonical
}

data "aws_ami" "bastion-blue" {
  most_recent = true

  filter {
    name   = "tag:Product"
    values = ["bastion"]
  }

  filter {
    name   = "tag:Color"
    values = ["Blue", "Green"]
  }

  owners = ["self"] # Canonical
}

