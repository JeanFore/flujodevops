# Terraform EC2 para el ejercicio

Esta carpeta crea una EC2 Amazon Linux 2023 preparada para el workflow de GitHub Actions:

- Usuario SSH: `ec2-user`
- Node.js y npm instalados
- PM2 instalado globalmente
- Puerto del backend: `3010`
- Ruta de despliegue: `/home/ec2-user/ai4devs-backend`

## 1. Crear una llave SSH

Desde PowerShell:

```powershell
ssh-keygen -t rsa -b 4096 -f "$env:USERPROFILE\.ssh\ai4devs-scdf" -C "ai4devs-scdf"
```

La llave publica va en Terraform:

```powershell
Get-Content "$env:USERPROFILE\.ssh\ai4devs-scdf.pub"
```

La llave privada va luego en GitHub Actions como secret `EC2_SSH_KEY`:

```powershell
Get-Content "$env:USERPROFILE\.ssh\ai4devs-scdf" -Raw
```

## 2. Configurar variables de Terraform

Copia el ejemplo:

```powershell
Copy-Item terraform.tfvars.example terraform.tfvars
```

Edita `terraform.tfvars` y coloca:

- `aws_access_key`
- `aws_secret_key`
- `ssh_public_key`

`terraform.tfvars` queda ignorado por git para no subir credenciales.

## 3. Crear la infraestructura

```powershell
terraform init
terraform plan
terraform apply
```

## 4. Configurar GitHub Secrets

Despues de `terraform apply`, usa los outputs:

- `EC2_INSTANCE`: usa `ec2_public_dns` o `ec2_public_ip`
- `EC2_USER`: `ec2-user`
- `EC2_DEPLOY_PATH`: `/home/ec2-user/ai4devs-backend`
- `EC2_SSH_KEY`: contenido completo de la llave privada generada en el paso 1

## 5. Destruir la infraestructura al terminar

```powershell
terraform destroy
```
