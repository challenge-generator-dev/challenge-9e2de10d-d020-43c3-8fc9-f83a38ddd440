# =============================================================================
# CONFIGURACIÓN ESPECÍFICA DEL ENTORNO DE DESARROLLO
# =============================================================================
# Este archivo sobrescribe los valores por defecto de terraform.tfvars
# para el entorno de desarrollo, optimizando costos y facilitando pruebas.

proyecto               = "pedidos-app"
entorno                = "dev"
aws_region            = "us-east-1"

# =============================================================================
# CONFIGURACIÓN DE RED - Desarrollo (recursos reducidos)
# =============================================================================
vpc_cidr_block        = "172.16.0.0/16"

# Solo dos AZs para desarrollo
public_subnet_cidrs   = ["172.16.1.0/24", "172.16.2.0/24"]
private_subnet_cidrs  = ["172.16.10.0/24", "172.16.11.0/24"]

# =============================================================================
# CONFIGURACIÓN DE BASE DE DATOS - Desarrollo (menor costo)
# =============================================================================
db_instance_class     = "db.t4g.micro"
db_allocated_storage  = 20
db_storage_type       = "gp3"
db_name               = "pedidos_dev"
db_username           = "devadmin"

# Desarrollo: sin multi-AZ para reducir costos
db_multi_az           = false
db_backup_retention   = 1
db_skip_final_snapshot = true

# =============================================================================
# CONFIGURACIÓN DE COMPUTE - Desarrollo (mínima capacidad)
# =============================================================================
compute_instance_type = "t4g.micro"

# Auto-scaling conservador para desarrollo
autoscale_min_capacity = 1
autoscale_max_capacity = 3
autoscale_target_cpu   = 80

# =============================================================================
# CONFIGURACIÓN DE API GATEWAY - Desarrollo
# =============================================================================
api_gateway_stage     = "dev"
api_gateway_throttle  = 100
api_gateway_quota     = 10000

# =============================================================================
# CONFIGURACIÓN DE SEGURIDAD - Desarrollo
# =============================================================================
# Logs habilitados pero con menor retención
enable_vpc_flow_logs  = true
enable_cloudtrail     = false

# Acceso más abierto en desarrollo para pruebas
allowed_cidr_blocks   = ["0.0.0.0/0"]

# =============================================================================
# TAGS ESPECÍFICOS DEL ENTORNO
# =============================================================================
tags = {
  Environment     = "development"
  ManagedBy       = "terraform"
  Project         = "pedidos-app"
  CostCenter      = "engineering"
  ComplianceLevel = "low"
  DevTeam         = "mobile-backend"
}