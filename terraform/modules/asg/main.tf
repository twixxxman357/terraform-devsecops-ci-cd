resource "aws_launch_template" "this" {
  name_prefix   = "${var.name}-lt"
  image_id      = "ami-12345678"
  instance_type = "t3.micro"
}

resource "aws_autoscaling_group" "this" {
  name                = var.name
  min_size            = 1
  max_size            = 2
  desired_capacity    = 1
  vpc_zone_identifier = var.subnet_ids

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  target_group_arns = [var.target_group_arn]
}

