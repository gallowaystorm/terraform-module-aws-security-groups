#-------------------------------------------
#Dynamic Security Group
#-------------------------------------------
resource "aws_security_group" "security_group" {
  for_each = var.security_group_list

  name = each.key
  dynamic "ingress" {
    for_each = each.value.ingress_rules[*]
    content {
      description = each.value.ingress_rules.description
      from_port   = each.value.ingress_rules.from_port
      to_port     = each.value.ingress_rules.to_port
      protocol    = each.value.ingress_rules.protocol
      cidr_blocks = each.value.ingress_rules.cidr_blocks
      self        = each.value.ingress_rules.is_self_source
    }
  }
  dynamic "egress" {
    for_each = each.value.egress_rules[*]
    content {
      description = each.value.egress_rules.description
      from_port   = each.value.egress_rules.from_port
      to_port     = each.value.egress_rules.to_port
      protocol    = each.value.egress_rules.protocol
      cidr_blocks = each.value.egress_rules.cidr_blocks
      self        = each.value.egress_rules.is_self_source
    }
  }
}
