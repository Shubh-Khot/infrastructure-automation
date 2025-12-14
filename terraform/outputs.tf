# Output VPC ID
output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the VPC"
}

# Output VPC CIDR
output "vpc_cidr" {
  value       = aws_vpc.main.cidr_block
  description = "The CIDR block of the VPC"
}

# Output Public Subnet IDs
output "public_subnet_ids" {
  value       = aws_subnet.public[*].id
  description = "The IDs of the public subnets"
}

# Output Private Subnet IDs
output "private_subnet_ids" {
  value       = aws_subnet.private[*].id
  description = "The IDs of the private subnets"
}

# Output Internet Gateway ID
output "internet_gateway_id" {
  value       = aws_internet_gateway.main.id
  description = "The ID of the Internet Gateway"
}

# Output NAT Gateway ID
output "nat_gateway_id" {
  value       = var.enable_nat_gateway ? aws_nat_gateway.main[0].id : null
  description = "The ID of the NAT Gateway"
}

# Output NAT Gateway Public IP
output "nat_gateway_ip" {
  value       = var.enable_nat_gateway ? aws_eip.nat[0].public_ip : null
  description = "The public IP of the NAT Gateway"
}

# Output Public Route Table ID
output "public_route_table_id" {
  value       = aws_route_table.public.id
  description = "The ID of the public route table"
}

# Output Private Route Table ID
output "private_route_table_id" {
  value       = aws_route_table.private.id
  description = "The ID of the private route table"
}

# Output ALB Security Group ID
output "alb_security_group_id" {
  value       = aws_security_group.alb.id
  description = "The ID of the ALB security group"
}

# Output Load Balancer DNS
output "load_balancer_dns" {
  value       = var.enable_load_balancer ? aws_lb.main[0].dns_name : null
  description = "The DNS name of the load balancer"
}

# Output Load Balancer ARN
output "load_balancer_arn" {
  value       = var.enable_load_balancer ? aws_lb.main[0].arn : null
  description = "The ARN of the load balancer"
}

# Output Target Group ARN
output "target_group_arn" {
  value       = var.enable_load_balancer ? aws_lb_target_group.main[0].arn : null
  description = "The ARN of the target group"
}
