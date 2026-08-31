# Asistencia Infra

Infraestructura como código (Terraform) para los repositorios y la protección de ramas del proyecto de control de asistencia MINERD.

## Qué gestiona

- Los repositorios [`asistencia-web`](https://github.com/Michael-2405/asistencia-web) y [`asistencia-api`](https://github.com/Michael-2405/asistencia-api) en GitHub (importados, no creados desde cero por Terraform).
- Reglas de protección de rama (`main` y `develop`) en ambos repositorios: requieren que el check de CI pase antes de mergear.

## Por qué "importados" y no "creados"

Los repos se crearon primero de forma manual (vacíos, sin código) para poder generar un token de GitHub con acceso limitado exactamente a esos dos repositorios — un token de "solo repos seleccionados" no puede seleccionar repos que aún no existen. Terraform los administra desde ese punto en adelante.

## Requisitos previos

- [Terraform](https://developer.hashicorp.com/terraform) >= 1.5
- Un [fine-grained personal access token](https://github.com/settings/tokens?type=beta) de GitHub con permiso `Administration: Read and write` sobre `asistencia-web` y `asistencia-api`

## Configuración

1. Copia el archivo de variables de ejemplo:

```bash
   cp terraform.tfvars.example terraform.tfvars
```

2. Completa `terraform.tfvars` con tu token y usuario de GitHub. **Este archivo nunca se commitea.**

3. Inicializa Terraform:

```bash
   terraform init
```

4. Si es la primera vez (los repos ya existen en GitHub pero no en el state de Terraform):

```bash
   terraform import github_repository.asistencia_web asistencia-web
   terraform import github_repository.asistencia_api asistencia-api
```

5. Revisa los cambios antes de aplicarlos:

```bash
   terraform plan
```

6. Aplica:

```bash
   terraform apply
```

## Estado del proyecto

El state de Terraform se mantiene local por ahora (uso de un solo desarrollador). Si el proyecto crece a más colaboradores o se integra con la infraestructura de AWS, este state debería migrar a un backend remoto (por ejemplo, S3).
