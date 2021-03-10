# To test out repo being called as module, change directory to "examples"
# and then run terraform init/validate/apply
# You will have to change the vpc_id in the YAML file and possibly the region below
module "test-security-group" {
  source              = "../"
  security_group_list = yamldecode(file("${path.module}/security-groups.yaml"))
  region              = "us-west-1"
}
