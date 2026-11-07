# Módulo de Database para la API de pedidos
# Superficie de práctica: implementar la configuración de la base de datos (RDS, DynamoDB)

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
}

variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
  default     = "pedidos-app"
}

variable "db_type" {
  description = "Tipo de base de datos: postgres, mysql, dynamodb"
  type        = string
  default     = "postgres"
}

variable "vpc_id" {
  description = "ID de la VPC donde se despliega"
  type        = string
}

variable "subnet_ids" {
  description = "IDs de las subredes para la base de datos"
  type        = list(string)
}

variable "security_group_ids" {
  description = "IDs de los security groups para la base de datos"
  type        = list(string)
}

variable "db_instance_class" {
  description = "Clase de instancia de la base de datos"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "Almacenamiento allocated en GB"
  type        = number
  default     = 20
}

variable "db_name" {
  description = "Nombre de la base de datos"
  type        = string
  default     = "pedidos_db"
}

variable "db_username" {
  description = "Usuario maestro de la base de datos"
  type        = string
  default     = "dbadmin"
}

variable "db_password" {
  description = "Contraseña maestra de la base de datos"
  type        = string
  sensitive   = true
}

variable "db_port" {
  description = "Puerto de la base de datos"
  type        = number
  default     = 5432
}

variable "db_engine_version" {
  description = "Versión del motor de base de datos"
  type        = string
  default     = "15.4"
}

variable "db_backup_retention_days" {
  description = "Días de retención de backups"
  type        = number
  default     = 7
}

variable "db_multi_az" {
  description = "Habilitar Multi-AZ"
  type        = bool
  default     = false
}

variable "db_skip_final_snapshot" {
  description = "Saltar snapshot final al destruir"
  type        = bool
  default     = true
}

variable "dynamodb_table_name" {
  description = "Nombre de la tabla DynamoDB (para mode dynamodb)"
  type        = string
  default     = "pedidos-table"
}

variable "dynamodb_billing_mode" {
  description = "Modo de facturación de DynamoDB: PROVISIONED o PAY_PER_REQUEST"
  type        = string
  default     = "PAY_PER_REQUEST"
}

locals {
  db_identifier = "${var.project_name}-${var.environment}-db"
  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}

resource "aws_db_subnet_group" "this" {
  name       = "${local.db_identifier}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = local.tags
}

resource "aws_security_group" "rds" {
  name        = "${local.db_identifier}-sg"
  description = "Security group para RDS ${var.environment}"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
    description = "Acceso a la base de datos desde la VPC"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound"
  }

  tags = local.tags
}

resource "aws_db_instance" "this" {
  identifier     = local.db_identifier
  engine         = "postgres"
  engine_version = var.db_engine_version
  instance_class = var.db_instance_class

  allocated_storage     = var.db_allocated_storage
  max_allocated_storage = var.db_allocated_storage * 2
  storage_type          = "gp3"
  storage_encrypted     = true

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password
  port     = var.db_port

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = concat([aws_security_group.rds.id], var.security_group_ids)

  backup_retention_period = var.db_backup_retention_days
  backup_window           = "03:00-04:00"
  maintenance_window      = "mon:04:00-mon:05:00"

  multi_az = var.db_multi_az

  skip_final_snapshot       = var.db_skip_final_snapshot
  final_snapshot_identifier = var.db_skip_final_snapshot ? null : "${local.db_identifier}-final-snapshot"

  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]

  deletion_protection = var.environment == "prod" ? true : false

  tags = local.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_dynamodb_table" "this" {
  name           = "${var.project_name}-${var.environment}-${var.dynamodb_table_name}"
  billing_mode   = var.dynamodb_billing_mode
  hash_key       = "id"
  range_key      = "createdAt"
  stream_enabled = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "createdAt"
    type = "S"
  }

  attribute {
    name = "userId"
    type = "S"
  }

  global_secondary_index {
    name            = "userId-index"
    hash_key        = "userId"
    projection_type = "ALL"
    read_capacity   = 5
    write_capacity  = 5
  }

  server_side_encryption {
    enabled = true
  }

  ttl {
    attribute_name = "ttl"
    enabled        = true
  }

  tags = local.tags
}

resource "aws_secretsmanager_secret" "db_credentials" {
  name = "${local.db_identifier}-credentials"

  recovery_window_in_days = 7

  tags = local.tags
}

resource "aws_secretsmanager_secret_version" "db_credentials" {
  secret_id = aws_secretsmanager_secret.db_credentials.id

  secret_string = jsonencode({
    username = var.db_username
    password = var.db_password
    engine   = "postgres"
    host     = aws_db_instance.this.address
    port     = var.db_port
    dbname   = var.db_name
  })
}

output "db_instance_endpoint" {
  description = "Endpoint de la instancia RDS"
  value       = aws_db_instance.this.endpoint
  sensitive   = true
}

output "db_instance_address" {
  description = "Dirección de la instancia RDS"
  value       = aws_db_instance.this.address
}

output "db_instance_port" {
  description = "Puerto de la instancia RDS"
  value       = aws_db_instance.this.port
}

output "db_instance_arn" {
  description = "ARN de la instancia RDS"
  value       = aws_db_instance.this.arn
}

output "dynamodb_table_name" {
  description = "Nombre de la tabla DynamoDB"
  value       = aws_dynamodb_table.this.name
}

output "dynamodb_table_arn" {
  description = "ARN de la tabla DynamoDB"
  value       = aws_dynamodb_table.this.arn
}

output "dynamodb_table_stream_arn" {
  description = "ARN del stream de DynamoDB"
  value       = aws_dynamodb_table.this.stream_arn
}

output "secrets_manager_arn" {
  description = "ARN del secreto de credenciales"
  value       = aws_secretsmanager_secret.db_credentials.arn
}