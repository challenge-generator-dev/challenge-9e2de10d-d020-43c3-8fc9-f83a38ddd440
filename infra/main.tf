# Orquestación principal de infraestructura para la API de la app de pedidos
# Este archivo orquesta los módulos que aprovisionan los recursos necesarios

locals {
  proyecto   = var.proyecto
  entorno   = var.entorno
  tags      = var.tags
  nombre_base = "${local.proyecto}-${local.entorno}"
}

# Módulo de red: VPC, subnets, gateways, rutas
module "network" {
  source = "./modules/network"

  proyecto = local.proyecto
  entorno = local.entorno
  vpc_cidr = var.vpc_cidr
  azs     = var.availability_zones
  tags    = local.tags
}

# Módulo de seguridad: Security groups, IAM roles, políticas
module "security" {
  source = "./modules/security"

  proyecto        = local.proyecto
  entorno         = local.entorno
  vpc_id          = module.network.vpc_id
  subnet_ids      = module.network.private_subnet_ids
  allowed_cidrs   = var.allowed_cidrs
  tags            = local.tags
}

# Módulo de base de datos: RDS PostgreSQL
module "database" {
  source = "./modules/database"

  proyecto           = local.proyecto
  entorno            = local.entorno
  vpc_id             = module.network.vpc_id
  subnet_ids         = module.network.private_subnet_ids
  security_group_ids = [module.security.database_sg_id]
  engine_version     = var.db_engine_version
  instance_class     = var.db_instance_class
  allocated_storage  = var.db_allocated_storage
  tags               = local.tags
}

# Módulo de compute: ECS Fargate, servicios
module "compute" {
  source = "./modules/compute"

  proyecto           = local.proyecto
  entorno            = local.entorno
  vpc_id             = module.network.vpc_id
  subnet_ids         = module.network.private_subnet_ids
  security_group_ids = [module.security.compute_sg_id]
  database_endpoint  = module.database.db_endpoint
  database_name      = var.db_name
  database_username  = var.db_username
  container_image    = var.container_image
  container_port     = var.container_port
  desired_count      = var.ecs_desired_count
  tags               = local.tags
}

# Módulo de API Gateway: endpoint público
module "api_gateway" {
  source = "./modules/api_gateway"

  proyecto          = local.proyecto
  entorno           = local.entorno
  vpc_id            = module.network.vpc_id
  security_group_id = module.security.api_gateway_sg_id
  subnet_ids        = module.network.public_subnet_ids
  alb_arn           = module.compute.alb_arn
  tags              = local.tags
}