# Configuración de seguridad para la API
# Superficie de práctica - completar según necesidades del proyecto

# TODO: Crear rol IAM para la API
# resource "aws_iam_role" "api_role" {
#   name = "${var.project}-${var.environment}-api-role"
#   
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       }
#     ]
#   })
#   
#   tags = {
#     Name        = "${var.project}-${var.environment}-api-role"
#     Environment = var.environment
#   }
# }

# TODO: Adjuntar políticas al rol
# resource "aws_iam_role_policy_attachment" "api_cloudwatch" {
#   role       = aws_iam_role.api_role.name
#   policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
# }

# TODO: Configurar Secrets Manager para credenciales
# resource "aws_secretsmanager_secret" "api_credentials" {
#   name        = "${var.project}-${var.environment}/api-credentials"
#   description = "Credenciales de la API"
#   
#   recovery_window_in_days = 7
#   
#   tags = {
#     Name        = "${var.project}-${var.environment}-api-credentials"
#     Environment = var.environment
#   }
# }

# TODO: Crear política de acceso a secrets
# resource "aws_iam_policy" "secrets_access" {
#   name        = "${var.project}-${var.environment}-secrets-access"
#   description = "Política de acceso a Secrets Manager"
#   
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Action = [
#           "secretsmanager:GetSecretValue",
#           "secretsmanager:DescribeSecret"
#         ]
#         Resource = aws_secretsmanager_secret.api_credentials.arn
#       }
#     ]
#   })
#   
#   tags = {
#     Name        = "${var.project}-${var.environment}-secrets-access"
#     Environment = var.environment
#   }
# }

# TODO: Configurar KMS para cifrado
# resource "aws_kms_key" "api_encryption" {
#   description             = "Clave KMS para cifrado de la API"
#   deletion_window_in_days = 10
#   
#   key_usage = "ENCRYPT_DECRYPT"
#   
#   tags = {
#     Name        = "${var.project}-${var.environment}-api-kms"
#     Environment = var.environment
#   }
# }