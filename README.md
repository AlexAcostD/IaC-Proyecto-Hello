# Infrastructure as Code – Azure Container App (Terraform)

Este proyecto utiliza **Terraform** como herramienta de *Infrastructure as Code (IaC)* para definir y gestionar la infraestructura necesaria para desplegar un microservicio en **Azure Container Apps** de forma declarativa y reproducible.

## Objective

Provisionar una infraestructura mínima en Azure que permita ejecutar un microservicio contenerizado, siguiendo buenas prácticas DevOps y evitando configuraciones manuales en el portal de Azure.

## Terraform Overview

Terraform se emplea para describir los recursos de Azure mediante archivos de configuración, permitiendo:
- Versionar la infraestructura
- Repetir despliegues de forma consistente
- Facilitar cambios controlados en los recursos

## Terraform Files Description

### provider.tf

Define el proveedor de nube utilizado en el proyecto.  
En este caso, se configura **Azure (azurerm)** y se establecen las características necesarias para que Terraform pueda interactuar con la suscripción.

### resource_group.tf

Se encarga de crear el **Resource Group** donde se agrupan todos los recursos relacionados con el despliegue del microservicio.

### variables.tf

Declara las variables utilizadas por Terraform para parametrizar el despliegue, como:
- Nombre del proyecto
- Nombre del container app
- Imagen del contenedor
- Región de Azure

Esto permite reutilizar la infraestructura sin modificar el código principal.

### terraform.tfvars

Archivo que contiene los valores concretos de las variables declaradas.  
Permite separar la configuración del entorno del código, facilitando el uso de distintos entornos (desarrollo, pruebas, producción).

### main.tf

Archivo principal donde se define el **Azure Container App**.  
Aquí se especifica:
- La imagen Docker a desplegar
- Los recursos asignados al contenedor
- El puerto expuesto
- La configuración de ingreso externo

## Deployment Flow

1. Terraform inicializa el proveedor de Azure.
2. Se valida la configuración de la infraestructura.
3. Se crea o reutiliza el entorno de Azure Container Apps.
4. Se despliega el microservicio usando la imagen Docker pública.
5. Azure expone la aplicación mediante una URL accesible externamente.

## Benefits

- Infraestructura reproducible y versionada
- Menor riesgo de errores manuales
- Fácil mantenimiento y escalabilidad
- Integración natural con pipelines CI/CD


