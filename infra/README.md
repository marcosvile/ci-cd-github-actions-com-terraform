# Infraestrutura - Terraform

Este diretório contém a configuração Terraform para provisionar a infraestrutura no Render.

## Arquivos

- `main.tf` - Configuração principal dos recursos
- `variables.tf` - Definições das variáveis
- `outputs.tf` - Outputs do Terraform
- `terraform.tfvars.example` - Exemplo de arquivo de variáveis

## Pré-requisitos

1. [Terraform](https://www.terraform.io/downloads.html) instalado
2. Conta no [Render](https://render.com/)
3. API Key do Render

## Configuração

1. **Configure a API Key do Render:**
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```
   Edite o arquivo `terraform.tfvars` e adicione sua API Key do Render.

2. **Inicialize o Terraform:**
   ```bash
   terraform init
   ```

3. **Planeje a infraestrutura:**
   ```bash
   terraform plan
   ```

4. **Aplique a configuração:**
   ```bash
   terraform apply
   ```
## Recursos Provisionados

- **Render Web Service**: Serviço web para hospedar a aplicação Flask
  - Tipo: Web Service
  - Ambiente: Docker
  - Plano: Starter (gratuito)
  - Região: Oregon
  - Auto-deploy habilitado

## Outputs

Após aplicar o Terraform, você terá acesso a:

- `service_url`: URL pública do serviço
- `service_id`: ID único do serviço no Render
- `service_name`: Nome do serviço

## Limpeza

Para remover todos os recursos:

```bash
terraform destroy
```
