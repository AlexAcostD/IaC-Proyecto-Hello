# Hello Microservice – FastAPI & Docker

Microservicio REST desarrollado en **Python con FastAPI**, que expone un endpoint `/hello` y se distribuye como una imagen Docker lista para ejecución local o despliegue en entornos cloud.

## Features

- API REST ligera basada en FastAPI  
- Endpoint `/hello` con respuesta personalizada  
- Uso de variables de entorno para configuración  
- Contenerización con Docker  
- Imagen preparada para entornos productivos

## Endpoint

### GET /hello

Devuelve un mensaje de saludo con el nombre configurado.

**Ejemplo de respuesta:**
```json
{
  "message": "Hola, soy Alexander 👋"
}
```
## Requirements
- Python 3.10 o superior
- Docker
## Docker Usage
### Build image
docker build -t hello-microservice .

### Run container
docker run -p 8000:8000 hello-microservice

La aplicación estará disponible en:

http://localhost:8000/hello

### Project Structure
.
├── app
│   └── main.py
├── Dockerfile
├── requirements.txt
└── README.md
