# Módulo de Infraestructura - App de Pedidos

Este repositorio contiene la definición de infraestructura como código para desplegar la API del backend de la aplicación móvil de pedidos.

## Estructura del Proyecto

```
infra/
├── versions.tf          # Configuración de versiones de Terraform y proveedores
├── main.tf              # Orquestación principal de módulos
├── providers.tf         # Configuración del proveedor AWS
├── variables.tf         # Variables de entrada del módulo
├── outputs.tf           # Salidas del módulo
├── terraform.tfvars     # Valores para el entorno de desarrollo
└── modules/             # Módulos reutilizables
    ├── api_gateway/
    ├── compute/
    ├── database/
    ├── network/
    └── security/
```

## Requisitos Previos

- Terraform >= 1.9.5
- AWS CLI configurado con credenciales válidas
- Acceso a la cuenta de AWS donde se desplegará la infraestructura

## Uso Básico

### Inicializar Terraform

```bash
cd infra
terraform init
```

### Validar la configuración

```bash
terraform validate
```

### Planificar los cambios

```bash
terraform plan -var-file=terraform.tfvars
```

### Aplicar la infraestructura

```bash
terraform apply -var-file=terraform.tfvars
```

### Destruir la infraestructura

```bash
terraform destroy -var-file=terraform.tfvars
```

## Entornos

La configuración soporta múltiples entornos mediante archivos tfvars separados:

- `terraform.tfvars` - Desarrollo
- `environments/prod/terraform.tfvars` - Producción (pendiente)

## Recursos Aprovisionados

Este módulo aprovisiona los siguientes recursos en AWS:

| Recurso | Descripción |
|---------|-------------|
| VPC | Red virtual privada con subnets públicas y privadas |
| RDS | Base de datos PostgreSQL para persistencia |
| ECS Fargate | Servicios de contenedores para la API |
| API Gateway | Punto de entrada HTTP para la API |
| Security Groups | Reglas de firewall para cada componente |
| ALB | Balanceador de carga para distribución de tráfico |

## Convenciones de Naming

Todos los recursos siguen el patrón de nomenclatura: `{proyecto}-{entorno}-{recurso}`

Ejemplo: `pedidos-dev-vpc`, `pedidos-prod-rds`

## Seguridad

- Las credenciales de AWS se gestionan mediante variables de entorno o perfil configurado en AWS CLI
- Los datos sensibles (contraseñas, keys) se parametrizan y nunca se versionan
- Los security groups siguen el principio de mínimo privilegio

## Troubleshooting

Si terraform init falla, verificar:
1. Que las credenciales de AWS estén configuradas correctamente
2. Que la versión de Terraform sea >= 1.9.5
3. Que el provider AWS 5.66.0 esté disponible