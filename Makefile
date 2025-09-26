# Default environment (set explicitly when running commands)
ENV ?= dev
PLAN_FILE ?= $(ENV).plan

# Paths for environment configs
TFVARS   = env/$(ENV)/$(ENV).tfvars
BACKEND  = env/$(ENV)/backend.tfbackend

# Initialize Terraform with backend config
init:
	terraform init -backend-config=$(BACKEND)

# Create a plan for the selected environment
plan:
	terraform plan -var-file=$(TFVARS) -out=$(PLAN_FILE)

# Apply the saved plan
apply:
	terraform apply $(PLAN_FILE)

# Destroy environment resources
destroy:
	terraform destroy -var-file=$(TFVARS)

# Show current Terraform state
show:
	terraform show

# Display Terraform outputs for the selected environment
outputs:
	terraform output > infra_outputs.txt

# Format Terraform files
fmt:
	terraform fmt -check

# Validate Terraform configuration
validate:
	terraform validate -var-file=$(TFVARS)

# Clean up generated files
clean:
	rm -f $(PLAN_FILE) infra_outputs.txt