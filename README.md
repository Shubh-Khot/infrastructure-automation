# Infrastructure Automation

A comprehensive Infrastructure as Code (IaC) repository featuring Terraform, CloudFormation, and Ansible configurations for complete AWS environment automation, CI/CD pipeline deployment, and multi-cloud infrastructure management with monitoring and security implementations.

## 📋 Table of Contents

- [Overview](#overview)
- [Repository Structure](#repository-structure)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Directory Guide](#directory-guide)
- [Features](#features)
- [CI/CD Pipeline](#cicd-pipeline)
- [Contributing](#contributing)
- [License](#license)

## Overview

This repository provides production-ready Infrastructure as Code templates and playbooks for deploying and managing AWS infrastructure. It demonstrates best practices in:

- **Infrastructure as Code**: Terraform and CloudFormation templates
- **Configuration Management**: Ansible playbooks for server setup
- **CI/CD**: GitHub Actions workflows for automated testing and validation
- **Security**: Security group configurations and firewall rules
- **Scalability**: Multi-AZ deployment support

## Repository Structure

```
infrastructure-automation/
├── .github/
│   └── workflows/
│       └── infrastructure-ci.yml         # GitHub Actions CI/CD workflow
├── terraform/
│   ├── main.tf                          # Main Terraform configuration
│   ├── variables.tf                     # Input variables
│   └── outputs.tf                       # Output values
├── cloudformation/
│   └── vpc-stack.yaml                   # CloudFormation VPC template
├── ansible/
│   └── site.yml                         # Ansible playbook
└── README.md                            # This file
```

## Prerequisites

### Required Tools

- **Terraform** >= 1.5.0
- **AWS CLI** >= 2.0
- **Ansible** >= 2.9
- **Python** >= 3.8
- **Git** >= 2.0

### AWS Requirements

- AWS Account with appropriate IAM permissions
- AWS credentials configured (`~/.aws/credentials`)
- IAM roles with EC2, VPC, and CloudFormation permissions

### Installation

```bash
# Install Terraform
wget https://releases.hashicorp.com/terraform/1.5.0/terraform_1.5.0_linux_amd64.zip
unzip terraform_1.5.0_linux_amd64.zip
sudo mv terraform /usr/local/bin/

# Install AWS CLI
pip install awscli

# Install Ansible
pip install ansible
```

## Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/Shubh-Khot/infrastructure-automation.git
cd infrastructure-automation
```

### 2. Deploy with Terraform

```bash
cd terraform

# Initialize Terraform
terraform init

# Format check
terraform fmt -check -recursive

# Validate configuration
terraform validate

# Plan deployment
terraform plan -out=tfplan

# Apply configuration
terraform apply tfplan
```

### 3. Configure Servers with Ansible

```bash
cd ansible

# Check playbook syntax
ansible-playbook --syntax-check site.yml

# Run playbook with inventory
ansible-playbook -i inventory.ini site.yml
```

## Directory Guide

### Terraform Directory

Contains Terraform configuration for AWS infrastructure:

- **main.tf**: VPC, subnets, internet gateway, NAT gateway, route tables, security groups, ALB
- **variables.tf**: Input variables with validation and defaults
- **outputs.tf**: Output values for resource IDs and DNS names

### CloudFormation Directory

Alternative IaC using AWS CloudFormation:

- **vpc-stack.yaml**: Complete VPC stack with public/private subnets, gateways, and routing

### Ansible Directory

Configuration management for server setup:

- **site.yml**: Playbook for system package installation, Docker setup, and firewall configuration

### .github/workflows Directory

CI/CD automation:

- **infrastructure-ci.yml**: GitHub Actions workflow for validation and security scanning

## Features

### Network Architecture

- ✅ VPC with customizable CIDR blocks
- ✅ Public and private subnets across multiple AZs
- ✅ Internet Gateway for public internet access
- ✅ NAT Gateway for private subnet outbound traffic
- ✅ Route tables with proper routing rules
- ✅ Network ACLs and security groups

### Load Balancing

- ✅ Application Load Balancer (ALB)
- ✅ Target groups for service routing
- ✅ Health checks for target availability
- ✅ HTTPS/TLS support ready

### Security

- ✅ Security group rules for HTTP/HTTPS
- ✅ SSH access control
- ✅ UFW firewall configuration via Ansible
- ✅ Security scanning in CI/CD pipeline

### Scalability

- ✅ Multi-AZ deployment support
- ✅ Parameterized configurations
- ✅ Auto-scaling ready architecture
- ✅ Modular code structure

## CI/CD Pipeline

The GitHub Actions workflow automatically:

1. **Validates Terraform** - Format check, init, validate
2. **Checks Ansible** - Syntax validation
3. **Validates CloudFormation** - cfn-lint validation
4. **Security Scanning** - Trivy vulnerability scanner

Runs on:
- Push to main branch
- Pull requests
- Manual trigger

## Usage Examples

### Deploy Infrastructure

```bash
# Using Terraform
terraform apply

# Using CloudFormation
aws cloudformation create-stack --stack-name my-vpc --template-body file://vpc-stack.yaml
```

### Configure Servers

```bash
# Run Ansible playbook
ansible-playbook -i hosts.ini ansible/site.yml
```

### Destroy Infrastructure

```bash
# Using Terraform
terraform destroy

# Using CloudFormation
aws cloudformation delete-stack --stack-name my-vpc
```

## Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Validate configurations
5. Submit a pull request

## License

This project is licensed under the MIT License - see LICENSE file for details.

## Contact

For questions or issues, please open a GitHub issue or contact Shubh-Khot.

---

**Last Updated**: December 2025
**Maintainer**: Shubh-Khot
