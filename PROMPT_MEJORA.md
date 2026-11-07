# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `infra/versions.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/api_gateway/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/compute/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/database/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/network/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/security/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Mapa de componentes

El repo tiene una carpeta por componente. Cada uno se instala y verifica dentro de la suya.

| Componente | Carpeta | Rol | Capa | Track | Tecnologias |
|---|---|---|---|---|---|
| `infra` | `infra/` | practice | infra | Terraform (AWS) | Terraform |
| `client` | `client/` | chapter, support | client | Flutter | Flutter |

## Orden de arranque

1. `cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate` — componente `infra` (practice).
2. `cd client && flutter pub get && flutter analyze` — componente `client` (chapter, support).

### Contratos entre componentes

- `client` expone http (api: https://api.pedidos.app):
  - `GET /orders`
  - `POST /orders`

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Lo que le falta a este proyecto

Esto NO lo tenes que adivinar: salio de comparar el proyecto contra la arquitectura declarada del reto y de un analisis estatico del codigo. Completalo TODO.

### Referencias colgando en el codigo que si esta

Cada una rompe la compilacion:

- `client/lib/core/network/api_client.dart` — `Order.toJson`: Se invoca `toJson` sobre `Order`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.

## Como saber que terminaste

```bash
(cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate) && (cd client && flutter pub get && flutter analyze)
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter Movil, Especialidad Desarrollador, Tecnología Flutter, Senior L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform para la app movil (corrida e2e 20261106212220607), Aprovisiona con Terraform los recursos que consume la aplicacion movil

### Misión / candidato
Desplegar la API de la app de pedidos

### Reto
- Tema: Infraestructura como codigo para el backend de una app movil
- Seniority: senior-l2
- Tipo: practical
- Título: Despliegue de la API de la app de pedidos usando Terraform
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Exploración y configuración inicial — objetivo: Configurar el entorno de Terraform y preparar los recursos básicos. — entregable (NO resolver): Archivo Terraform inicial con proveedores y variables configuradas.
- Fase 2: Aprovisionamiento de recursos — objetivo: Aprovisionar los recursos necesarios para la API usando Terraform. — entregable (NO resolver): Archivo Terraform actualizado con todos los recursos aprovisionados.
- Fase 3: Despliegue y verificación — objetivo: Desplegar la API y verificar que todo funciona correctamente. — entregable (NO resolver): API desplegada y verificada, con todos los recursos funcionando correctamente.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: infra/variables.tf ===
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

// === ARCHIVO: infra/providers.tf ===
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

// === ARCHIVO: infra/versions.tf ===
terraform {
  required_version = ">= 1.9.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.66.0"
    }
  }
}

// === ARCHIVO: infra/README.md ===
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

// === ARCHIVO: infra/main.tf ===
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

// === ARCHIVO: infra/outputs.tf ===
output "api_gateway_endpoint" {
  description = "Endpoint público del API Gateway para acceder a la API"
  value       = module.api_gateway.api_endpoint
}

output "api_gateway_arn" {
  description = "ARN del API Gateway desplegado"
  value       = module.api_gateway.api_gateway_arn
}

output "compute_cluster_endpoint" {
  description = "Endpoint del cluster de compute donde corre la API"
  value       = module.compute.cluster_endpoint
}

output "database_endpoint" {
  description = "Endpoint de la base de datos PostgreSQL"
  value       = module.database.database_endpoint
  sensitive   = true
}

output "database_name" {
  description = "Nombre de la base de datos"
  value       = module.database.database_name
}

output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.network.vpc_id
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas donde desplegar los servicios"
  value       = module.network.private_subnet_ids
}

output "public_subnet_ids" {
  description = "IDs de las subnets públicas para el API Gateway"
  value       = module.network.public_subnet_ids
}

output "security_group_id" {
  description = "ID del security group para los servicios de la API"
  value       = module.security.api_security_group_id
}

output "ecs_cluster_name" {
  description = "Nombre del cluster ECS donde se desplegará la API"
  value       = module.compute.ecs_cluster_name
}

output "rds_instance_arn" {
  description = "ARN de la instancia RDS"
  value       = module.database.rds_instance_arn
}

output "aws_region" {
  description = "Región de AWS donde se desplegó la infraestructura"
  value       = var.aws_region
}

// === ARCHIVO: infra/terraform.tfvars ===
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

// === ARCHIVO: infra/environments/dev/terraform.tfvars ===
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

// === ARCHIVO: infra/modules/api_gateway/main.tf ===
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

// === ARCHIVO: infra/modules/compute/main.tf ===
# Módulo de Compute para la API de pedidos
# Superficie de práctica: implementar la configuración de servidores (EC2, Lambda, ECS)

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
}

variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
  default     = "pedidos-app"
}

variable "compute_type" {
  description = "Tipo de compute: lambda, ecs, o ec2"
  type        = string
  default     = "lambda"
}

variable "vpc_id" {
  description = "ID de la VPC donde se despliega"
  type        = string
}

variable "subnet_ids" {
  description = "IDs de las subredes para los recursos de compute"
  type        = list(string)
}

variable "security_group_ids" {
  description = "IDs de los security groups"
  type        = list(string)
}

variable "lambda_runtime" {
  description = "Runtime de Lambda"
  type        = string
  default     = "nodejs20.x"
}

variable "lambda_memory_size" {
  description = "Memoria en MB para Lambda"
  type        = number
  default     = 256
}

variable "lambda_timeout" {
  description = "Timeout en segundos para Lambda"
  type        = number
  default     = 30
}

variable "lambda_function_name" {
  description = "Nombre de la función Lambda"
  type        = string
  default     = "pedidos-api-handler"
}

variable "lambda_zip_file" {
  description = "Ruta al archivo ZIP de la función Lambda"
  type        = string
  default     = "../build/pedidos-api.zip"
}

variable "db_host" {
  description = "Host de la base de datos"
  type        = string
  sensitive   = true
}

variable "db_port" {
  description = "Puerto de la base de datos"
  type        = number
  default     = 5432
}

variable "db_name" {
  description = "Nombre de la base de datos"
  type        = string
  sensitive   = true
}

variable "db_username" {
  description = "Usuario de la base de datos"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Contraseña de la base de datos"
  type        = string
  sensitive   = true
}

variable "environment_variables" {
  description = "Variables de entorno para la función Lambda"
  type        = map(string)
  default     = {}
}

locals {
  function_name = "${var.project_name}-${var.environment}-${var.lambda_function_name}"
  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}

resource "aws_iam_role" "lambda_exec" {
  name = "${local.function_name}-exec-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })

  tags = local.tags
}

resource "aws_iam_role_policy_attachment" "lambda_basic" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "lambda_vpc" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

resource "aws_iam_policy" "lambda_secrets" {
  name = "${local.function_name}-secrets-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "secretsmanager:GetSecretValue"
      ]
      Resource = "*"
    }]
  })

  tags = local.tags
}

resource "aws_iam_role_policy_attachment" "lambda_secrets" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = aws_iam_policy.lambda_secrets.arn
}

resource "aws_lambda_function" "this" {
  filename         = var.lambda_zip_file
  function_name    = local.function_name
  role            = aws_iam_role.lambda_exec.arn
  handler         = "index.handler"
  source_code_hash = fileexists(var.lambda_zip_file) ? filebase64sha256(var.lambda_zip_file) : null
  runtime          = var.lambda_runtime
  timeout          = var.lambda_timeout
  memory_size      = var.lambda_memory_size

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  environment {
    variables = merge(var.environment_variables, {
      DB_HOST     = var.db_host
      DB_PORT     = tostring(var.db_port)
      DB_NAME     = var.db_name
      DB_USERNAME = var.db_username
      DB_PASSWORD = var.db_password
      ENVIRONMENT = var.environment
    })
  }

  tags = local.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lambda_permission" "api_gateway" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:*:*:*/*/*"
}

resource "aws_lambda_alias" "this" {
  name             = var.environment
  function_name    = aws_lambda_function.this.function_name
  function_version = "$LATEST"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_cloudwatch_log_group" "lambda" {
  name              = "/aws/lambda/${local.function_name}"
  retention_in_days = 7

  tags = local.tags
}

output "lambda_function_arn" {
  description = "ARN de la función Lambda"
  value       = aws_lambda_function.this.arn
}

output "lambda_function_name" {
  description = "Nombre de la función Lambda"
  value       = aws_lambda_function.this.function_name
}

output "lambda_invoke_arn" {
  description = "ARN de invocación de la función Lambda"
  value       = aws_lambda_function.this.invoke_arn
}

output "lambda_role_arn" {
  description = "ARN del rol de ejecución de Lambda"
  value       = aws_iam_role.lambda_exec.arn
}

// === ARCHIVO: infra/modules/database/main.tf ===
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

// === ARCHIVO: infra/modules/network/main.tf ===
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

// === ARCHIVO: infra/modules/security/main.tf ===
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

// === ARCHIVO: client/pubspec.yaml ===
name: pedidos_app
description: Aplicación móvil de pedidos con API backend
version: 1.0.0+1

environment:
  sdk: ">=3.6.0 <4.0.0"
  flutter: ">=3.27.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.2
  flutter_riverpod: ^2.5.1
  freezed_annotation: ^2.4.4

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.8
  freezed: ^2.4.6

flutter:
  uses-material-design: true

// === ARCHIVO: client/lib/main.dart ===
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pedidos_app/presentation/screens/order_screen.dart';

void main() {
  runApp(const ProviderScope(child: PedidosApp()));
}

class PedidosApp extends StatelessWidget {
  const PedidosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedidos App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OrderScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Configuración de variables de entorno para la API
class ApiConfig {
  static const String baseUrl = 'https://api.pedidos.app';
}

// Modelo de Order (inmutable con freezed)
@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required String customerId,
    required List<OrderItem> items,
    required String status,
    required DateTime createdAt,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String productId,
    required int quantity,
    required double price,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);
}

// Repositorio abstracto (contrato)
abstract class OrderRepository {
  Future<List<Order>> getOrders();
  Future<Order> createOrder(Order order);
}

// Provider para inyección de dependencias
final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  throw UnimplementedError('Implementación debe ser proporcionada por la capa data');
});

// === ARCHIVO: client/lib/core/network/api_client.dart ===
// Cliente HTTP para consumir la API de pedidos. Maneja conexiones, errores y parsing de respuestas.

package 'package:pedidos_app/core/network/api_client.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pedidos_app/main.dart';

class ApiClient {
  final http.Client _client;
  final String baseUrl;

  ApiClient({http.Client? client, String? baseUrl})
      : _client = client ?? http.Client(),
        baseUrl = baseUrl ?? ApiConfig.baseUrl;

  Future<List<Order>> getOrders() async {
    try {
      final response = await _client.get(
        Uri.parse('$baseUrl/orders'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Order.fromJson(json)).toList();
      } else {
        throw Exception('Error al obtener pedidos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de red al obtener pedidos: $e');
    }
  }

  Future<Order> createOrder(Order order) async {
    try {
      final response = await _client.post(
        Uri.parse('$baseUrl/orders'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(order.toJson()),
      );

      if (response.statusCode == 201) {
        return Order.fromJson(json.decode(response.body));
      } else {
        throw Exception('Error al crear pedido: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de red al crear pedido: $e');
    }
  }

  void dispose() {
    _client.close();
  }
}

// === ARCHIVO: client/lib/domain/repositories/order_repository.dart ===
// Contrato abstracto para el repositorio de pedidos. Define las operaciones que la capa de dominio
// necesita para interactuar con los datos de pedidos.

package 'package:pedidos_app/domain/repositories/order_repository.dart';

import 'package:pedidos_app/main.dart';

abstract class OrderRepository {
  Future<List<Order>> getOrders();

  Future<Order> createOrder(Order order);

  // Validación de invariantes para los pedidos
  void validateOrder(Order order) {
    if (order.items.isEmpty) {
      throw ArgumentError('El pedido debe contener al menos un item');
    }
    if (order.items.any((item) => item.quantity <= 0)) {
      throw ArgumentError('La cantidad de cada item debe ser mayor a cero');
    }
    if (order.total <= 0) {
      throw ArgumentError('El total del pedido debe ser mayor a cero');
    }
  }
}

// === ARCHIVO: client/lib/domain/usecases/get_orders.dart ===
// Caso de uso para obtener la lista de pedidos. Coordina la interacción entre la capa de presentación
// y el repositorio de pedidos, aplicando reglas de negocio.

package 'package:pedidos_app/domain/usecases/get_orders.dart';

import 'package:pedidos_app/domain/repositories/order_repository.dart';
import 'package:pedidos_app/main.dart';

class GetOrders {
  final OrderRepository orderRepository;

  GetOrders(this.orderRepository);

  Future<List<Order>> call() async {
    try {
      final orders = await orderRepository.getOrders();
      // Aplicar reglas de negocio adicionales si es necesario
      return orders.where((order) => order.status != 'cancelled').toList();
    } catch (e) {
      // Manejo de errores específico para el caso de uso
      throw Exception('No se pudieron obtener los pedidos: $e');
    }
  }
}

// === ARCHIVO: client/android/app/src/main/AndroidManifest.xml ===
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
    
    <application
        android:label="Pedidos App"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher"
        android:enableOnBackInvokedCallback="true">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:taskAffinity=""
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
    <queries>
        <intent>
            <action android:name="android.intent.action.PROCESS_TEXT"/>
            <data android:mimeType="text/plain"/>
        </intent>
    </queries>
</manifest>

// === ARCHIVO: client/lib/data/repositories/order_repository_impl.dart ===
package pedidos_app.data.repositories;

import 'package:pedidos_app/core/network/api_client.dart';
import 'package:pedidos_app/domain/models/order.dart';
import 'package:pedidos_app/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final ApiClient _apiClient;
  
  OrderRepositoryImpl(this._apiClient);
  
  @override
  Future<List<Order>> getOrders() async {
    return await _apiClient.getOrders();
  }
  
  @override
  Future<Order> createOrder(Order order) async {
    validateOrder(order);
    return await _apiClient.createOrder(order);
  }
  
  @override
  void validateOrder(Order order) {
    if (order.items == null || order.items!.isEmpty) {
      throw ArgumentError('El pedido debe tener al menos un elemento');
    }
    
    for (final item in order.items!) {
      if (item.productName == null || item.productName!.isEmpty) {
        throw ArgumentError('Cada elemento debe tener un nombre de producto');
      }
      if (item.price == null || item.price! <= 0) {
        throw ArgumentError('Cada elemento debe tener un precio válido');
      }
      if (item.quantity == null || item.quantity! <= 0) {
        throw ArgumentError('Cada elemento debe tener una cantidad válida');
      }
    }
    
    if (order.customerName == null || order.customerName!.isEmpty) {
      throw ArgumentError('El pedido debe tener un nombre de cliente');
    }
    
    if (order.customerEmail == null || order.customerEmail!.isEmpty) {
      throw ArgumentError('El pedido debe tener un email de cliente');
    }
  }
}

// === ARCHIVO: client/lib/presentation/screens/order_screen.dart ===
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pedidos_app/presentation/viewmodels/order_viewmodel.dart';

class OrderScreen extends ConsumerWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderState = ref.watch(orderViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _buildBody(context, ref, orderState),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreateOrderDialog(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('Nuevo Pedido'),
      ),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, OrderScreenState state) {
    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state.errorMessage != null) {
      return _buildErrorView(context, ref, state.errorMessage!);
    }

    if (state.orders.isEmpty) {
      return _buildEmptyView(context);
    }

    return _buildOrderList(context, state.orders);
  }

  Widget _buildErrorView(BuildContext context, WidgetRef ref, String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Error al cargar pedidos',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              error,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => ref.read(orderViewModelProvider.notifier).loadOrders(),
              icon: const Icon(Icons.refresh),
              label: const Text('Reintentar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyView(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: 80,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'No hay pedidos aún',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Crea tu primer pedido tocando el botón de abajo',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderList(List orders) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return _OrderCard(order: order);
      },
    );
  }

  void _showCreateOrderDialog(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _CreateOrderBottomSheet(
        onSubmit: (items) async {
          await ref.read(orderViewModelProvider.notifier).createOrder(items);
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final dynamic order;

  const _OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    final orderId = order.id?.toString() ?? 'N/A';
    final totalAmount = order.totalAmount ?? 0.0;
    final status = order.status ?? 'desconocido';
    final createdAt = order.createdAt?.toString() ?? 'Sin fecha';
    final itemCount = order.items?.length ?? 0;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pedido #$orderId',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                _StatusChip(status: status),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 4),
                Text(
                  '$itemCount artículo${itemCount != 1 ? 's' : ''}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 4),
                Text(
                  createdAt,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  '\$${totalAmount.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String status;

  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    final (color, label) = _getStatusConfig(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }

  (Color, String) _getStatusConfig(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return (Colors.orange, 'Pendiente');
      case 'processing':
        return (Colors.blue, 'Procesando');
      case 'completed':
        return (Colors.green, 'Completado');
      case 'cancelled':
        return (Colors.red, 'Cancelado');
      default:
        return (Colors.grey, status);
    }
  }
}

class _CreateOrderBottomSheet extends StatefulWidget {
  final Future<void> Function(List<Map<String, dynamic>> items) onSubmit;

  const _CreateOrderBottomSheet({required this.onSubmit});

  @override
  State<_CreateOrderBottomSheet> createState() => _CreateOrderBottomSheetState();
}

class _CreateOrderBottomSheetState extends State<_CreateOrderBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, dynamic>> _items = [];
  final _itemNameController = TextEditingController();
  final _itemPriceController = TextEditingController();
  final _itemQuantityController = TextEditingController(text: '1');
  bool _isSubmitting = false;

  @override
  void dispose() {
    _itemNameController.dispose();
    _itemPriceController.dispose();
    _itemQuantityController.dispose();
    super.dispose();
  }

  void _addItem() {
    if (_itemNameController.text.isEmpty || _itemPriceController.text.isEmpty) {
      return;
    }

    final price = double.tryParse(_itemPriceController.text) ?? 0.0;
    final quantity = int.tryParse(_itemQuantityController.text) ?? 1;

    setState(() {
      _items.add({
        'name': _itemNameController.text,
        'price': price,
        'quantity': quantity,
      });
      _itemNameController.clear();
      _itemPriceController.clear();
      _itemQuantityController.text = '1';
    });
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  double get _totalAmount {
    return _items.fold(
      0.0,
      (sum, item) => sum + (item['price'] as double) * (item['quantity'] as int),
    );
  }

  Future<void> _submit() async {
    if (_items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Agrega al menos un artículo')),
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      await widget.onSubmit(_items);
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nuevo Pedido',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _itemNameController,
                      decoration: const InputDecoration(
                        labelText: 'Artículo',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _itemPriceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Precio',
                        border: OutlineInputBorder(),
                        prefixText: '\$ ',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _itemQuantityController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Cant.',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              FilledButton.tonal(
                onPressed: _addItem,
                child: const Text('Agregar Artículo'),
              ),
              if (_items.isNotEmpty) ...[
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 8),
                Text(
                  'Artículos en el pedido:',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                ...List.generate(_items.length, (index) {
                  final item = _items[index];
                  return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(item['name'] as String),
                    subtitle: Text(
                      '\$${(item['price'] as double).toStringAsFixed(2)} x ${item['quantity']}',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () => _removeItem(index),
                    ),
                  );
                }),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total:',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '\$${_totalAmount.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 24),
              FilledButton(
                onPressed: _isSubmitting ? null : _submit,
                child: _isSubmitting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Crear Pedido'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

// === ARCHIVO: client/lib/presentation/viewmodels/order_viewmodel.dart ===
package pedidos_app.presentation.viewmodels;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pedidos_app/domain/models/order.dart';
import 'package:pedidos_app/domain/repositories/order_repository.dart';
import 'package:pedidos_app/domain/usecases/get_orders.dart';

enum OrderViewModelStatus {
  initial,
  loading,
  loaded,
  error,
  creating,
  created,
}

class OrderViewModelState {
  final OrderViewModelStatus status;
  final List<Order> orders;
  final String? errorMessage;
  final Order? lastCreatedOrder;
  
  const OrderViewModelState({
    this.status = OrderViewModelStatus.initial,
    this.orders = const [],
    this.errorMessage,
    this.lastCreatedOrder,
  });
  
  OrderViewModelState copyWith({
    OrderViewModelStatus? status,
    List<Order>? orders,
    String? errorMessage,
    Order? lastCreatedOrder,
  }) {
    return OrderViewModelState(
      status: status ?? this.status,
      orders: orders ?? this.orders,
      errorMessage: errorMessage,
      lastCreatedOrder: lastCreatedOrder ?? this.lastCreatedOrder,
    );
  }
}

class OrderViewModel extends StateNotifier<OrderViewModelState> {
  final OrderRepository _orderRepository;
  final GetOrders _getOrdersUseCase;
  
  OrderViewModel(this._orderRepository, this._getOrdersUseCase)
      : super(const OrderViewModelState());
  
  Future<void> loadOrders() async {
    state = state.copyWith(status: OrderViewModelStatus.loading);
    
    try {
      final orders = await _getOrdersUseCase();
      state = state.copyWith(
        status: OrderViewModelStatus.loaded,
        orders: orders,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        status: OrderViewModelStatus.error,
        errorMessage: 'Error al cargar los pedidos: ${e.toString()}',
      );
    }
  }
  
  Future<void> createOrder(Order order) async {
    state = state.copyWith(status: OrderViewModelStatus.creating);
    
    try {
      final createdOrder = await _orderRepository.createOrder(order);
      final updatedOrders = [...state.orders, createdOrder];
      
      state = state.copyWith(
        status: OrderViewModelStatus.created,
        orders: updatedOrders,
        lastCreatedOrder: createdOrder,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        status: OrderViewModelStatus.error,
        errorMessage: 'Error al crear el pedido: ${e.toString()}',
      );
    }
  }
  
  void resetStatus() {
    if (state.status == OrderViewModelStatus.created ||
        state.status == OrderViewModelStatus.error) {
      state = state.copyWith(status: OrderViewModelStatus.loaded);
    }
  }
  
  void refreshOrders() {
    loadOrders();
  }
}

final orderViewModelProvider =
    StateNotifierProvider<OrderViewModel, OrderViewModelState>((ref) {
  final orderRepository = ref.watch(orderRepositoryProvider);
  final getOrdersUseCase = ref.watch(getOrdersProvider);
  return OrderViewModel(orderRepository, getOrdersUseCase);
});

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  throw UnimplementedError('El OrderRepository debe ser proporcionado en el main');
});

final getOrdersProvider = Provider<GetOrders>((ref) {
  final orderRepository = ref.watch(orderRepositoryProvider);
  return GetOrders(orderRepository);
});
```
