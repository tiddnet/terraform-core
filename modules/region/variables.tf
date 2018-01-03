
variable "availability_zones" {}
variable "aws_region" {}

variable "vpc_networks" {
  description = "CIDR block lookup map for regional VPCs"
  type        = "map"

  default = {
    #us-east-1      ="10.0.0.0/16" # (in use)
    us-east-2      = "10.7.0.0/16"
    ap-northeast-2 = "10.4.0.0/16"
    eu-west-2      = "10.8.0.0/16"
  }
}


