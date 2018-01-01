
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

# Setup default security policies

# Setup s3 bucket for remote state

# Setup dynamoDB for state lock file

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
