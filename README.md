# Dynamic Security Group Module

## Table of Contents
1.  [Usage](#usage)
2.  [Requirements](#requirements)
3.  [Providers](#providers)
4.  [Inputs](#inputs)
5.  [Outputs](#outputs)
<!-- 6.  [Testing](#testing) -->

## Usage
```terraform
module "test-security-group" {
  source              = "https://github.com/gallowaystorm/tf-aws-security-group-module.git"
  security_group_list = yamldecode(file("${path.module}/security-groups.yaml"))
  region              = "us-east-1"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.13 |
| aws | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| security\_group\_list| This is the list of security groups in YAML format that needs to be decoded with yamldecode (\see example below\) | `decoded YAML` | N/A | yes |

## Outputs

| Name | Description |
|------|-------------|
| security_group_output | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- ## Testing -->

### Critical

Your YAML file with security groups must follow the template below:

```yaml
test-security-group:
  group_description: "Group Description One"
  vpc_id: "vpc-47f30121"
  ingress_rules:
    - description: "Test description"
      is_self_source: "false"
      from_port: 80
      to_port: 80
      protocol: "tcp"
      cidr_blocks: ["0.0.0.0/0", "10.10.0.0/16"]
    - description: "Test description 2"
      is_self_source: "false"
      from_port: 443
      to_port: 443
      protocol: "tcp"
      cidr_blocks: ["0.0.0.0/0"]
    - description: "Test description 3"
      is_self_source: "true"
      from_port: 8080
      to_port: 8080
      protocol: "tcp"
      cidr_blocks: ["0.0.0.0/0"]
  egress_rules:
    - description: "Test description 4"
      is_self_source: "false"
      from_port: 80
      to_port: 80
      protocol: "tcp"
      cidr_blocks: ["0.0.0.0/0"]
test-security-group-02:
  group_description: "Group Description Two"
  vpc_id: "vpc-47f30121"
  ingress_rules:
    - description: "Test description"
      is_self_source: "true"
      from_port: 80
      to_port: 80
      protocol: "tcp"
      cidr_blocks: ["0.0.0.0/0", "10.10.0.0/16"]
    - description: "Test description 2"
      is_self_source: "false"
      from_port: 443
      to_port: 443
      protocol: "tcp"
      cidr_blocks: ["0.0.0.0/0"]
    - description: "Test description 3"
      is_self_source: "false"
      from_port: 8080
      to_port: 8080
      protocol: "tcp"
      cidr_blocks: ["0.0.0.0/0"]
  egress_rules:
    - description: "Test description 4"
      is_self_source: "false"
      from_port: 80
      to_port: 80
      protocol: "tcp"
      cidr_blocks: ["0.0.0.0/0"]
```

<!-- ### Set AWS Credentials
```bash
export AWS_PROFILE=<configured name of aws profile>
export AWS_REGION=<aws_region>
```

### Normal Testing

```bash
cd ./tests
go mod init tests
go get github.com/gruntwork-io/terratest
go get github.com/stretchr/testify
go test -v -run TestECRModule -timeout 15m
``` -->

