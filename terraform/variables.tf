# AWS Region
variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region for resources"
}

# Environment
variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment name (dev, staging, prod)"
  
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

# Project Name
variable "project_name" {
  type        = string
  default     = "infra-automation"
  description = "Project name for resource naming"
}

# VPC CIDR Block
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC"
}

# Public Subnet CIDRs
variable "public_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "CIDR blocks for public subnets"
}

# Private Subnet CIDRs
variable "private_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.11.0/24"]
  description = "CIDR blocks for private subnets"
}

# Enable NAT Gateway
variable "enable_nat_gateway" {
  type        = bool
  default     = true
  description = "Enable NAT Gateway for private subnets"
}

# Enable Load Balancer
variable "enable_load_balancer" {
  type        = bool
  default     = true
  description = "Enable Application Load Balancer"
}

# Tags
variable "additional_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags to apply to all resources"
}
