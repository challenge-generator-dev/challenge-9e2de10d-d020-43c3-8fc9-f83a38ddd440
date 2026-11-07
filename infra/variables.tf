# Variables para parametrizar la configuración de la infraestructura de la API de pedidos

variable "project_name" {
  description = "Nombre del proyecto para identificar recursos"
  type        = string
  default     = "pedidos-app"
}

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "Región de AWS donde se desplegarán los recursos"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "api_gateway_stage_name" {
  description = "Nombre del stage para el API Gateway"
  type        = string
  default     = "api"
}

variable "db_instance_class" {
  description = "Clase de instancia para la base de datos"
  type        = string
  default     = "db.t3.micro"
}

variable "db_engine_version" {
  description = "Versión del motor de base de datos"
  type        = string
  default     = "15.4"
}

variable "db_allocated_storage" {
  description = "Almacenamiento inicial asignado a la base de datos (GB)"
  type        = number
  default     = 20
}

variable "ec2_instance_type" {
  description = "Tipo de instancia EC2 para los servidores de la API"
  type        = string
  default     = "t3.micro"
}

variable "ec2_min_size" {
  description = "Número mínimo de instancias en el Auto Scaling Group"
  type        = number
  default     = 2
}

variable "ec2_max_size" {
  description = "Número máximo de instancias en el Auto Scaling Group"
  type        = number
  default     = 4
}

variable "ec2_desired_capacity" {
  description = "Capacidad deseada de instancias en el Auto Scaling Group"
  type        = number
  default     = 2
}

variable "tags" {
  description = "Tags adicionales para los recursos"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}