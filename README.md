# Despliegue de la API de la app de pedidos usando Terraform

La aplicación móvil de pedidos necesita una API robusta y escalable. Tu tarea es aprovisionar la infraestructura necesaria para desplegar esta API usando Terraform. Debes considerar los recursos que consume la aplicación móvil y asegurarte de que la API esté disponible y pueda manejar el tráfico esperado. Los recursos incluyen servidores, bases de datos y servicios de red.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo para el backend de una app movil |
| **Nivel** | senior-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Exploración y configuración inicial

**Objetivo:** Configurar el entorno de Terraform y preparar los recursos básicos.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Identifica los recursos necesarios para la API de la app de pedidos.
- Configura el entorno de Terraform para comenzar a trabajar.
- Crea un archivo Terraform básico que incluya los proveedores y las variables necesarias.

**Entregable:** Archivo Terraform inicial con proveedores y variables configuradas.

<details>
<summary>Pistas de conocimiento</summary>

- Considera los tipos de recursos que Terraform puede gestionar.
- Piensa en las variables que necesitarás para parametrizar tu configuración.

</details>

### Fase 2: Aprovisionamiento de recursos

**Objetivo:** Aprovisionar los recursos necesarios para la API usando Terraform.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Añade los recursos necesarios al archivo Terraform, como servidores, bases de datos y servicios de red.
- Asegura que los recursos estén correctamente configurados para soportar la API.
- Realiza una revisión de código para asegurar que todo está correcto antes de aplicar los cambios.

**Entregable:** Archivo Terraform actualizado con todos los recursos aprovisionados.

<details>
<summary>Pistas de conocimiento</summary>

- Revisa la documentación de Terraform para asegurarte de que estás usando los recursos correctamente.
- Considera los diferentes tipos de recursos y cómo interactúan entre sí.

</details>

### Fase 3: Despliegue y verificación

**Objetivo:** Desplegar la API y verificar que todo funciona correctamente.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Aplica los cambios usando Terraform para desplegar la API.
- Verifica que todos los recursos están correctamente configurados y que la API está disponible.
- Realiza pruebas para asegurar que la API puede manejar el tráfico esperado.

**Entregable:** API desplegada y verificada, con todos los recursos funcionando correctamente.

<details>
<summary>Pistas de conocimiento</summary>

- Usa herramientas de prueba para verificar que la API está funcionando como se espera.
- Considera diferentes escenarios de prueba para asegurar que la API es robusta.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y por qué se usa en este reto?
- **paraQueSirve**: ¿Para qué sirve aprovisionar la infraestructura con Terraform en este contexto?
- **comoSeUsa**: ¿Cómo se usa Terraform para aprovisionar los recursos necesarios para la API?
- **erroresComunes**: ¿Qué errores comunes pueden ocurrir al aprovisionar la infraestructura con Terraform?
- **queDecisionesImplica**: ¿Qué decisiones implica el despliegue de la API usando Terraform?

## Criterios de Evaluacion

- Configuración inicial de Terraform con proveedores y variables.
- Aprovisionamiento de recursos necesarios para la API.
- Despliegue y verificación de la API funcionando correctamente.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

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

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
(cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate) && (cd client && flutter pub get && flutter analyze)
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
