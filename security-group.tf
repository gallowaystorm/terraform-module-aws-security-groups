#-------------------------------------------
#Dynamic Security Group
#-------------------------------------------
resource "aws_security_group" "security_group" {

  dynamic "security-groups" {
    for_each = var.security_group_list
    content {
      name = each.value.name
      #parses through list of security rules that are passed into module
      dynamic "ingress" {
        for_each = var.security_group_list[count.index].ingress_rules
        content {
          description = ingress.description
          from_port   = ingress.from_port
          to_port     = ingress.to_port
          protocol    = ingress.protocol
          cidr_blocks = ingress.cidr_blocks
          self        = ingress.is_self_source
        }
      }
      dynamic "egress" {
        for_each = var.security_group_list[count.index].egress_rules
        content {
          description = egress.description
          from_port   = egress.from_port
          to_port     = egress.to_port
          protocol    = egress.protocol
          cidr_blocks = egress.cidr_blocks
          self        = egress.is_self_source
        }
      }
    }
  }
}
