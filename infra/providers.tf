# Configuración de proveedores para Terraform

terraform {
  required_version = ">= 1.9.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.66.0"
    }
  }
}

# Configuración del proveedor AWS
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = merge(
      var.tags,
      {
        Project     = var.project_name
        Environment = var.environment
      }
    )
  }
}

# Configuración para backend remoto (opcional - se puede configurar en otro archivo)
# terraform {
#   backend "s3" {
#     bucket = "mi-bucket-terraform-state"
#     key    = "pedidos-app/terraform.tfstate"
#     region = "us-east-1"
#   }
# }

# Validación de la configuración del proveedor
locals {
  aws_config_validation = {
    region_valid = contains([
      "us-east-1", "us-east-2", "us-west-1", "us-west-2",
      "eu-west-1", "eu-central-1", "ap-southeast-1", "ap-southeast-2"
    ], var.aws_region)
  }
}

# Módulo para validar que la región es soportada
output "aws_region_validation" {
  value = local.aws_config_validation.region_valid ? "Región válida" : "ERROR: Región no soportada"
}

# Configuración adicional para recursos específicos
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

# Ejemplo de configuración para CloudFront (requiere región us-east-1)
# resource "aws_cloudfront_distribution" "api_distribution" {
#   provider = aws.us_east_1
#   # ... configuración de CloudFront
# }

# Validaciones adicionales para entornos
locals {
  environment_validation = {
    env_valid = contains(["dev", "staging", "prod"], var.environment)
  }
}

# Output de validación de entorno
output "environment_validation" {
  value = local.environment_validation.env_valid ? "Entorno válido" : "ERROR: Entorno no válido (debe ser dev, staging o prod)"
}