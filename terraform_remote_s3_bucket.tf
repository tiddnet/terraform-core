provider "aws" {
  # This file is installed using aws cli command aws configure. In the future we may want to use specific roles to manage aws operations
  shared_credentials_file = "~/.aws/credentials"
  # pretty sure region can be defined elsewhere, but this provider is linked to the bucket for the state file. Until we abstract this further, I don't see the need to move the region - pre-mature optimization 
  region = "us-east-2"
}
# terraform state file setup
# create an S3 bucket to store the state file in (can this be abstracted? Revisit when we do other s3 bucket creations)
resource "aws_s3_bucket" "terraform-state-storage-s3" {
    bucket = "xxxxxxxxxxxxxxxx-terraform-remote-state-storage-s3"
 
    versioning {
      enabled = true
    }
 
    lifecycle {
      prevent_destroy = true
    }
 
    tags {
      Name = "S3 Remote Terraform Core State"
    }      
}
