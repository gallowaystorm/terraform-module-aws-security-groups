module "test-security-group" {
  source              = "../"
  security_group_list = yamldecode(file("${path.module}/test.yaml"))
  region              = "us-west-1"
}
