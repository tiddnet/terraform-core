provider "aws" {
  # This file is installed using aws cli command aws configure. In the future we may want to use specific roles to manage aws operations
  shared_credentials_file = "~/.aws/credentials"

  # pretty sure region can be defined elsewhere, but this provider is linked to the bucket for the state file. Until we abstract this further, I don't see the need to move the region - pre-mature optimization
  region = "${var.aws_region}"
}


# # Given a region, lookup the subnets available from vpc_networks (map)
resource "aws_vpc" "main" {
  cidr_block = "${lookup(var.vpc_networks, var.aws_region)}"

  tags {
    Name = "VPC ${var.aws_region} managed by terraform"
  }
}

# Expose all available availability zones within the region
data "aws_availability_zones" "available" {
  state = "available"
}

# Define an internet gateway
resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "igw-${var.aws_region}"
  }
}

# Create a routing table for the public subnets
resource "aws_route_table" "public" {
  count  = "${length(data.aws_availability_zones.available.names)}"
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }
}

# Create default security group
resource "aws_default_security_group" "default" {
  vpc_id = "${aws_vpc.main.id}"

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
