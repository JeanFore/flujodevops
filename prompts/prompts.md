# Prompts iniciales SCDF

## Tests de backend

Prompt utilizado:

```text
Actua como un ingeniero DevOps senior. Necesito un job de GitHub Actions para un backend Node.js/TypeScript ubicado en la carpeta backend. El job debe ejecutarse en ubuntu-latest, descargar el repositorio, configurar Node.js 20, instalar dependencias con npm ci usando backend/package-lock.json, generar Prisma Client con npm run prisma:generate y ejecutar los tests de Jest con npm test -- --runInBand. El workflow debe activarse cuando se haga push a una rama con un Pull Request abierto.
```

## Generacion del build del backend

Prompt utilizado:

```text
Actua como un ingeniero DevOps senior. A partir de un backend Node.js/TypeScript con script npm run build, genera un job de GitHub Actions que dependa de los tests, instale dependencias, genere Prisma Client, ejecute el build y empaquete los archivos necesarios para produccion: package.json, package-lock.json, prisma y dist. El resultado debe publicarse como artefacto temporal para que lo use el job de despliegue.
```

## Despliegue del backend en EC2

Prompt utilizado:

```text
Actua como un ingeniero DevOps senior. Necesito un job de GitHub Actions que descargue el artefacto del backend y lo despliegue en una instancia EC2 por SSH. Usa secrets de GitHub, sin escribir credenciales en el repositorio: EC2_INSTANCE para el host, EC2_SSH_KEY para la llave privada, EC2_USER opcional con valor por defecto ec2-user y EC2_DEPLOY_PATH opcional. El job debe copiar el tar.gz al servidor, descomprimirlo en el directorio current, ejecutar npm ci, npm run prisma:generate, npm prune --omit=dev y reiniciar la aplicacion con PM2 usando el nombre ai4devs-backend.
```

## Trigger del pipeline

Prompt utilizado:

```text
Configura el workflow para que se active con pull_request en los tipos opened, synchronize y reopened. El tipo synchronize debe cubrir el caso principal del ejercicio: cada push nuevo a una rama que ya tiene un Pull Request abierto.
```

Prueba de pipeline con EC2 SCDF.

Validacion SSH pipeline SCDF: bcec53e.
