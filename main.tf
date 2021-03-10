#-------------------------------------------
#Dynamic Security Group
#-------------------------------------------
resource "aws_security_group" "security_group" {
  #loops through security groups in list
  for_each = var.security_group_list
  #grabs name from the keys in the security group list
  name        = each.key
  description = each.value.group_description
  vpc_id      = each.value.vpc_id
  dynamic "ingress" {
    #loops through every "ingress_rules" attribute in YAML file
    for_each = each.value.ingress_rules[*]
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      self        = ingress.value.is_self_source
    }
  }
  dynamic "egress" {
    #loops through every "egress_rules" attribute in YAML file
    for_each = each.value.egress_rules[*]
    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      self        = egress.value.is_self_source
    }
  }
}
