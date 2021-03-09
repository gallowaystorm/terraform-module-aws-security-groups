module "test-security-group" {
  source              = "../"
  security_group_list = yamldecode(file("${path.module}/security-groups.yaml"))
  region              = "us-west-1"
}
