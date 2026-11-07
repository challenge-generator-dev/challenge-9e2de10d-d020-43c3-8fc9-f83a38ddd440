# Configuración de red para la API
# Superficie de práctica - completar según necesidades del proyecto

# TODO: Definir VPC principal
# resource "aws_vpc" "main" {
#   cidr_block           = var.vpc_cidr
#   enable_dns_hostnames = true
#   enable_dns_support   = true
#   
#   tags = {
#     Name        = "${var.project}-${var.environment}-vpc"
#     Environment = var.environment
#   }
# }

# TODO: Definir subnets (públicas y privadas)
# resource "aws_subnet" "public" {
#   count             = var.availability_zones
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index)
#   availability_zone = data.aws_availability_zones.available.names[count.index]
#   
#   map_public_ip_on_launch = true
#   
#   tags = {
#     Name        = "${var.project}-${var.environment}-public-subnet-${count.index + 1}"
#     Type        = "public"
#     Environment = var.environment
#   }
# }

# TODO: Crear Internet Gateway
# resource "aws_internet_gateway" "main" {
#   vpc_id = aws_vpc.main.id
#   
#   tags = {
#     Name        = "${var.project}-${var.environment}-igw"
#     Environment = var.environment
#   }
# }

# TODO: Configurar Security Groups
# resource "aws_security_group" "api" {
#   name        = "${var.project}-${var.environment}-api-sg"
#   description = "Security group para la API"
#   vpc_id      = aws_vpc.main.id
#   
#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   
#   tags = {
#     Name        = "${var.project}-${var.environment}-api-sg"
#     Environment = var.environment
#   }
# }

# TODO: Definir tablas de rutas