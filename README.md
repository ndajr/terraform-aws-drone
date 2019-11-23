# terraform-aws-drone

Base structure for Drone CI/CD pipeline using terraform to create AWS resources.

## Installation

Programs required:

- terraform
- tflint

1. Replace the variables on tfvars and locals.tf to your account info.
1. For the first time you run, comment the "backend s3" line on providers.tf
1. Set the aws credentials using the [aws-cli](https://aws.amazon.com/cli/) command **aws configure**
1. cd terraform && terraform init && terraform apply -var-file config/dev/terraform.tfvars

## Usage

After the dynamo and s3 tfstate creation:

### Plan

```sh
make plan
```

### Apply

```sh
make apply
```
