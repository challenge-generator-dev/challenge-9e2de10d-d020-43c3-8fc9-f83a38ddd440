# =============================================================================
# CONFIGURACIÓN PRINCIPAL DEL PROYECTO
# =============================================================================
# Este archivo contiene los valores por defecto para todas las variables
# necesarias para el aprovisionamiento de la infraestructura de la API.
# Los valores aquí definidos se pueden sobrescribir por entorno.

proyecto               = "pedidos-app"
entorno                = "prd"
aws_region            = "us-east-1"

# =============================================================================
# CONFIGURACIÓN DE RED
# =============================================================================
# CIDR blocks para la VPC principal y subnets
vpc_cidr_block        = "10.0.0.0/16"

# Subnets públicas para API Gateway y balanceadores de carga
public_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

# Subnets privadas para los servicios de la API y base de datos
private_subnet_cidrs  = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]

# Disponibilidad de zonas para redundancia
availability_zones    = ["us-east-1a", "us-east-1b", "us-east-1c"]

# =============================================================================
# CONFIGURACIÓN DE BASE DE DATOS
# =============================================================================
# Parámetros de la instancia RDS PostgreSQL
db_instance_class     = "db.r6g.xlarge"
db_allocated_storage  = 500
db_storage_type       = "gp3"
db_name               = "pedidos_db"
db_username           = "pedidosadmin"

# Configuración de alta disponibilidad
db_multi_az           = true
db_backup_retention   = 7
db_skip_final_snapshot = false

# =============================================================================
# CONFIGURACIÓN DE COMPUTE (ECS Fargate)
# =============================================================================
# Capacidad del cluster de compute
compute_instance_type = "t4g.medium"

# Configuración de auto-scaling para la API
autoscale_min_capacity = 2
autoscale_max_capacity = 10
autoscale_target_cpu   = 70

# =============================================================================
# CONFIGURACIÓN DE API GATEWAY
# =============================================================================
api_gateway_stage     = "v1"
api_gateway_throttle  = 1000
api_gateway_quota     = 1000000

# =============================================================================
# CONFIGURACIÓN DE SEGURIDAD
# =============================================================================
# Habilitar logging detallado
enable_vpc_flow_logs  = true
enable_cloudtrail     = true

# Políticas de seguridad
allowed_cidr_blocks   = ["0.0.0.0/0"]

# =============================================================================
# TAGS PERSONALIZADOS
# =============================================================================
tags = {
  Environment     = "production"
  ManagedBy       = "terraform"
  Project         = "pedidos-app"
  CostCenter      = "engineering"
  ComplianceLevel = "high"
}