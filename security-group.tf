#-------------------------------------------
#Dynamic Security Group
#-------------------------------------------
resource "aws_security_group" "security_group" {
  for_each = var.security_group_list

  name = each.key
  description = each.
  dynamic "ingress" {
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
