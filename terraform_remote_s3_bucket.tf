# terraform state file setup
# create an S3 bucket to store the state file in (can this be abstracted? Revisit when we do other s3 bucket creations)
resource "aws_s3_bucket" "terraform-state-storage-s3" {
  bucket = "scientiamobile.co.za-terraform-remote-state-storage-s3"

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
