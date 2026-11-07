output "api_gateway_endpoint" {
  description = "Endpoint público del API Gateway para acceder a la API"
  value       = module.api_gateway.api_endpoint
}

output "api_gateway_arn" {
  description = "ARN del API Gateway desplegado"
  value       = module.api_gateway.api_gateway_arn
}

output "compute_cluster_endpoint" {
  description = "Endpoint del cluster de compute donde corre la API"
  value       = module.compute.cluster_endpoint
}

output "database_endpoint" {
  description = "Endpoint de la base de datos PostgreSQL"
  value       = module.database.database_endpoint
  sensitive   = true
}

output "database_name" {
  description = "Nombre de la base de datos"
  value       = module.database.database_name
}

output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.network.vpc_id
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas donde desplegar los servicios"
  value       = module.network.private_subnet_ids
}

output "public_subnet_ids" {
  description = "IDs de las subnets públicas para el API Gateway"
  value       = module.network.public_subnet_ids
}

output "security_group_id" {
  description = "ID del security group para los servicios de la API"
  value       = module.security.api_security_group_id
}

output "ecs_cluster_name" {
  description = "Nombre del cluster ECS donde se desplegará la API"
  value       = module.compute.ecs_cluster_name
}

output "rds_instance_arn" {
  description = "ARN de la instancia RDS"
  value       = module.database.rds_instance_arn
}

output "aws_region" {
  description = "Región de AWS donde se desplegó la infraestructura"
  value       = var.aws_region
}