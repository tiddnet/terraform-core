output "my-source-ami" {
  value = "${data.aws_ami.deploy.id}"
}
