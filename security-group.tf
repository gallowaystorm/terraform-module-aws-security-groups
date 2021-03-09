#-------------------------------------------
#Dynamic Security Group
#-------------------------------------------
resource "aws_security_group" "security_group" {
  name = var.security_group_name
  self = var.is_self_source

  #parses through list of security rules that are passed into module
  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      description = ingress.value.description
      from_port = ingress.value.from_port
      to_port   = ingress.value.to_port
      protocol  = protocal.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
    dynamic "egress" {
    for_each = var.egress_ports
    content {
      description = egress.value.description
      from_port = egress.value.from_port
      to_port   = egress.value.to_port
      protocol  = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}
