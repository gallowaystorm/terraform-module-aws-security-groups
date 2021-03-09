module "test-security-group" {
    source = "../"
    security_groups = yamldecode(file("${path.module}/examples/security-groups.yaml"))
    region = "us-east-1"
}
