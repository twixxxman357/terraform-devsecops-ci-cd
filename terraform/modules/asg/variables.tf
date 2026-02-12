variable "name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "target_group_arn" {
  type = string
}

