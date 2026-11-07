# Módulo de API Gateway para la API de pedidos
# Superficie de práctica: implementar la configuración del API Gateway

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
}

variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
  default     = "pedidos-app"
}

variable "api_name" {
  description = "Nombre del API Gateway"
  type        = string
  default     = "pedidos-api"
}

variable "stage_name" {
  description = "Nombre del stage de despliegue"
  type        = string
  default     = "v1"
}

variable "compute_function_arn" {
  description = "ARN de la función Lambda o servicio de compute"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC donde se despliega"
  type        = string
}

variable "subnet_ids" {
  description = "IDs de las subredes para el API Gateway"
  type        = list(string)
}

variable "allowed_ips" {
  description = "IPs permitidas para acceder al API (opcional)"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

resource "aws_api_gateway_rest_api" "this" {
  name        = "${var.project_name}-${var.environment}-${var.api_name}"
  description = "API Gateway para la API de pedidos - Entorno ${var.environment}"

  endpoint_configuration {
    types = ["REGIONAL"]
    vpc_endpoint_ids = []
  }
}

resource "aws_api_gateway_resource" "this" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  parent_id   = aws_api_gateway_rest_api.this.root_resource_id
  path_part   = "pedidos"
}

resource "aws_api_gateway_method" "any" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.this.id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_resource.this.id
  http_method = aws_api_gateway_method.any.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.compute_function_arn
}

resource "aws_api_gateway_deployment" "this" {
  rest_api_id = aws_api_gateway_rest_api.this.id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "this" {
  deployment_id = aws_api_gateway_deployment.this.id
  rest_api_id   = aws_api_gateway_rest_api.this.id
  stage_name    = var.stage_name

  access_log_settings {
    destination_arn = aws_api_gateway_account.this.execution_arn
    format         = "$context.requestId: $context.endpoint $context.httpMethod $context.status $context.responseLatency $context.requestTime"
  }
}

resource "aws_api_gateway_account" "this" {
  cloudwatch_role_arn = aws_iam_role.api_gateway_cloudwatch.arn
}

resource "aws_iam_role" "api_gateway_cloudwatch" {
  name = "${var.project_name}-${var.environment}-apigw-cloudwatch-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "apigateway.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy" "api_gateway_cloudwatch" {
  name = "${var.project_name}-${var.environment}-apigw-cloudwatch-policy"
  role = aws_iam_role.api_gateway_cloudwatch.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams",
        "logs:PutLogEvents"
      ]
      Resource = "arn:aws:logs:*:*:*"
    }]
  })
}

resource "aws_api_gateway_usage_plan" "this" {
  name = "${var.project_name}-${var.environment}-usage-plan"

  api_stages {
    api_id = aws_api_gateway_rest_api.this.id
    stage  = aws_api_gateway_stage.this.stage_name
  }

  quota_settings {
    limit  = 1000000
    period = "MONTH"
  }

  throttle_settings {
    burst_limit = 5000
    rate_limit  = 1000
  }
}

output "api_gateway_id" {
  description = "ID del API Gateway"
  value       = aws_api_gateway_rest_api.this.id
}

output "api_gateway_execution_arn" {
  description = "ARN de ejecución del API Gateway"
  value       = aws_api_gateway_rest_api.this.execution_arn
}

output "api_gateway_endpoint" {
  description = "Endpoint del API Gateway"
  value       = "${var.stage_name}.execute-api.${data.aws_region.current.name}.amazonaws.com"
}

output "api_gateway_arn" {
  description = "ARN del API Gateway"
  value       = aws_api_gateway_rest_api.this.arn
}

data "aws_region" "current" {}