.PHONY: default
default:
	@echo "Please read the README.md for more details on how to use the Makefile"
	
--GREEN=\033[0;32m
--YELLOW=\033[0;33m
--RED=\033[0;31m
--NC=\033[0m # No Color
--TERRAFORM_TEMPORARY_NAME := terraform_copied_$(shell date +%s)

export AWS_ACCESS_KEY_ID=$(shell aws configure get default.aws_access_key_id)
export AWS_SECRET_ACCESS_KEY=$(shell aws configure get default.aws_secret_access_key)
export AWS_DEFAULT_REGION=$(shell aws configure get default.region)

ifndef AWS_ACCESS_KEY_ID
  $(error AWS_ACCESS_KEY_ID not present)
endif	
ifndef AWS_SECRET_ACCESS_KEY
  $(error AWS_SECRET_ACCESS_KEY not present)
endif	
ifndef AWS_DEFAULT_REGION
  $(error AWS_DEFAULT_REGION not present)
endif	


##################################
## Main
##################################
.PHONY: plan apply

plan: --clean --clone_temporary_terraform
	@echo "\nPlanning dev infra\n"
	cd $(--TERRAFORM_TEMPORARY_NAME) && \
	terraform init && \
	tflint && \
	terraform plan -var-file=config/dev.tfvars

apply: plan
	@echo "\n$(--YELLOW)Running terraform apply for platform environment.\n\n $(--NC)Do you wish to continue? (y/n)" && read ans && [ $$ans == y ]
	cd $(--TERRAFORM_TEMPORARY_NAME) && \
	terraform apply -var-file=config/dev.tfvars

##################################
## Utils
##################################
--clone_temporary_terraform:
	@echo "Cloning terraform folder to temporary folder \"$(--TERRAFORM_TEMPORARY_NAME)\""
	@cp -rf terraform $(--TERRAFORM_TEMPORARY_NAME)

--clean:
	@echo "Cleaning temporary terraform folders..."
	@rm -rf terraform_copied_*