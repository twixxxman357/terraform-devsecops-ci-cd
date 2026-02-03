package terraform.security

deny[msg] {
  input.resource_type == "aws_db_instance"
  input.region != "ap-northeast-1"
  msg := "Databases must only be deployed in Japan (ap-northeast-1)."
}

