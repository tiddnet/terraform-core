# #### ######### #####
# Core terraform state: 
# #### ######### #####

#
#  Variables that can be used by multiple modules. 
#  Global/Utilities that provide services to other modules. 
#
#

# Setup VPCs

# Setup Public Subnets

# Setup DNS delegation sets

resource "aws_route53_zone" "main" {
  name = "pseudonet.us."
}

resource "aws_route53_delegation_set" "main" {
  reference_name = "pseudonet.us"
}

resource "aws_route53_record" "ns" {
  zone_id = "${aws_route53_zone.main.zone_id}"
  name    = "pseudonet.us."
  type    = "NS"
  ttl     = "172800"
  records = ["ns-274.awsdns-34.com", "ns-1108.awsdns-10.org", "ns-650.awsdns-17.net", "ns-1955.awsdns-52.co.uk"]
}

# Setup default security policies 


# Setup s3 bucket for remote state - done


# Setup dynamoDB for state lock file - done


# Copy AMIs  


#module "search" {
#  source = "search"
#  region = "us-east-1"
#}
#
#module "copy-to-us-east-2" {
#  source   = "copy"
#  region   = "us-east-2"
#  copy_ami = "${module.search.my-source-ami}"
#}
#
#module "copy-to-us-west-1" {
#  source   = "copy"
#  region   = "us-west-1"
#  copy_ami = "${module.search.my-source-ami}"
#}
#
#module "copy-to-us-west-2" {
#  source   = "copy"
#  region   = "us-west-2"
#  copy_ami = "${module.search.my-source-ami}"
#}
#
#

