module "vpc-ap-northeast-2" {
  source             = "modules/region"
  aws_region         = "ap-northeast-2"
  availability_zones = "2"
}
