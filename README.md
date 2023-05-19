Proyecto del BootCamp Devops, en el cual se pide crear una infraestructura mediante Terraform para mantener Webservers y que estos sean administrados por ansible.
<p align="center">
                                           # Diagrama de la arquitectura
  
  ![](./images/infra_azure.png)
<p>

# Terraform
  
Lo primero que vamos a hacer es clonar el repositorio en nuestra maquina local con el comando:
  
```
git clone https://github.com/EstebanMengoni/Terraform-Azure-Ansible.git
```
Bien ahora necesitamos instalarnos el CLI de Azure y Terraform para poder deployar con Terraform la infraestructura en nuestra cuenta de Azure (Si lo tenes instalado podes saltear la primera parte)

Instalar Azure CLI en tu dispositivo: https://learn.microsoft.com/es-es/cli/azure/install-azure-cli
Instalar Terraform en tu dispositivo: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
  
Una vez instalados procederemos a loguearnos en azure usando:
  
```
az login
```
  
Ya logueados en nuestra cuenta nos posicionaremos en la carpeta del repositorio, para despues ejecutar el siguientes comandos:
  
```
terraform init
```
```
terraform apply
```
  
Una vez finalizado el deploy de la infraestructura, deberiamos de tener en nuestra cuenta de azure un grupo de recursos con el nombre que elegimos y todos sus recursos:
  

