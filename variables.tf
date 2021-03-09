variable "region" {
  default = "us-east-1"
  type = string
}

variable "security_group_name" {
  type = string
}

variable "is_self_source" {
  description = "Boolean value that determins whether or not the security groups itself is a source"
  type = bool
}

variable "security_groups" {
  description = "List of security groups to be made"
  type = string(list)
}

