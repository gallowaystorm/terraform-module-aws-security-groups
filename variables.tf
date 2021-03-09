variable "region" {
  default = "us-east-1"
  type    = string
}
variable "security_group_list" {
  description = "List of security groups to be made"
}
variable "is_self_source" {
  description = "Boolean value that determins whether or not the security groups itself is a source"
  type        = bool
}


