# CI/CD com GitHub Actions e Terraform

Este projeto demonstra a implementação de um pipeline CI/CD para containerizar e executar uma API Python Flask que fornece frases motivacionais aleatórias.

## Descrição do Projeto

A aplicação consiste em uma API simples construída com Flask que:

- Fornece frases motivacionais aleatórias através do endpoint `/frase`
- Página inicial informativa no endpoint `/`
- Tratamento de erros 404 personalizado
- Retorna respostas em formato JSON com encoding UTF-8 correto
- É containerizada usando Docker para facilitar o deployment
- Executa na porta 80 (porta padrão HTTP)

## Endpoints Disponíveis

- **GET `/`** - Página inicial com mensagem de boas-vindas
- **GET `/frase`** - Retorna uma frase motivacional aleatória
- **Qualquer rota inexistente** - Retorna erro 404 personalizado

## Executando com Docker

1. **Clone este repositório:**

   ```bash
   git clone <url-do-repositorio>
   cd ci-cd-h3
   ```

2. **Construa a imagem Docker:**

   ```bash
   docker build -t api-advice .
   ```

3. **Execute o container:**

   ```bash
   docker run -p 80:80 api-advice
   ```

4. **Teste a API:**

   - **Página inicial:**
     ```bash
     curl http://localhost/
     ```
     **Resposta esperada:**
     ```json
     {"message": "Bem-vindo à API de Frases Motivacionais!"}
     ```

   - **Frase motivacional:**
     ```bash
     curl http://localhost/frase
     ```
     **Resposta esperada:**
     ```json
     {"frase": "Acredite em você!"}
     ```

   - **Erro 404:**
     ```bash
     curl http://localhost/inexistente
     ```
     **Resposta esperada:**
     ```json
     {"error": "Rota não encontrada"}
     ```

## Estrutura do Projeto

```
ci-cd-h3/
├── .editorconfig                # Configurações do editor
├── .gitignore                   # Arquivos ignorados pelo Git
├── Dockerfile                   # Configuração do container Docker (raiz)
├── LICENSE                      # Licença do projeto
├── README.md                    # Este arquivo
├── app/                         # Aplicação principal
│   ├── advice.py                # Aplicação Flask principal
│   └── requirements.txt         # Dependências Python
└── infra/                       # Infraestrutura como código (Terraform)
    ├── main.tf                  # Configuração principal dos recursos
    ├── variables.tf             # Definições das variáveis
    ├── outputs.tf               # Outputs do Terraform
    ├── terraform.tfvars.example # Exemplo de arquivo de variáveis
    └── README.md                # Documentação da infraestrutura
```

## Infraestrutura

O projeto inclui configuração de infraestrutura como código usando Terraform para provisionamento no Render.

### Deploy com Terraform

1. **Navegue até o diretório de infraestrutura:**
   ```bash
   cd infra
   ```

2. **Configure suas credenciais:**
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   # Edite terraform.tfvars e adicione sua API Key do Render
   ```

3. **Inicialize e aplique a infraestrutura:**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

Para mais detalhes sobre a infraestrutura, consulte o arquivo `infra/README.md`.

### CI/CD Pipeline

O projeto está configurado para funcionar com GitHub Actions que:

1. Constrói automaticamente a imagem Docker
2. Faz deploy no Render com GitHub Actions
3. Provisiona a infraestrutura via Terraform

A aplicação será implantada automaticamente sempre que houver commits na branch `main`.
