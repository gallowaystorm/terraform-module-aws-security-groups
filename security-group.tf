#-------------------------------------------
#Dynamic Security Group
#-------------------------------------------
resource "aws_security_group" "security_group" {
  for_each = var.security_group_list.security_groups

  name = each.key
  dynamic "ingress" {
    for_each = each.value
    content {
      description = ingress[ingress_rules].description
      from_port   = ingress.ingress_rules.from_port
      to_port     = ingress.ingress_rules.to_port
      protocol    = ingress.ingress_rules.protocol
      cidr_blocks = ingress.ingress_rules.cidr_blocks
      self        = ingress.ingress_rules.is_self_source
    }
  }
  dynamic "egress" {
    for_each = var.security_group_list.security_groups
    content {
      description = egress.egress_rules.description
      from_port   = egress.egress_rules.from_port
      to_port     = egress.egress_rules.to_port
      protocol    = egress.egress_rules.protocol
      cidr_blocks = egress.egress_rules.cidr_blocks
      self        = egress.egress_rules.is_self_source
    }
  }
}
