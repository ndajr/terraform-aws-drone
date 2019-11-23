# terraform-aws-drone

Base structure for Drone CI/CD pipeline using terraform to create AWS resources.

## Usage

Programs required:

- terraform
- tflint

Set the aws credentials using the [aws-cli](https://aws.amazon.com/cli/) command **aws configure**

### Plan

```sh
make plan
```

### Apply

```sh
make apply
```
