module "vpc-ap-northeast-2" {
  source             = "modules/region"
  aws_region         = "ap-northeast-2"
  availability_zones = "2"
}

output "vpc-ap-northeast-2.public-subnet_ids" {
  value = ["${module.vpc-ap-northeast-2.subnet_ids}"]
}
output "vpc-ap-northeast-2.aws_vpc.main.id" {
  value = "${module.vpc-ap-northeast-2.aws_vpc.main.id}"
}
output "vpc-ap-northeast-2.aws_default_security_group.default.id" {
  value = "${module.vpc-ap-northeast-2.aws_default_security_group.default.id}"
}
