package terraform.compute

deny[msg] {
  input.resource_type == "aws_instance"
  input.associate_public_ip_address == true
  msg := "EC2 instances must not have public IP addresses."
}

