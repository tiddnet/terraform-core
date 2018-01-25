# Configure the AWS Provider
provider "aws" {
  # abstract the version constraint into the vars.tf or elsewhere
  version = "~> 1.7"
  shared_credentials_file = "~/.aws/credentials"
  region                  = "${var.region}"
}
