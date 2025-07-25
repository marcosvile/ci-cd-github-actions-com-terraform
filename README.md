# CI/CD - H3

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

2. **Navegue até o diretório da aplicação:**

   ```bash
   cd app
   ```

3. **Construa a imagem Docker:**

   ```bash
   docker build -t api-advice .
   ```

4. **Execute o container:**

   ```bash
   docker run -p 80:80 api-advice
   ```

5. **Teste a API:**

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
├── .editorconfig       # Configurações do editor
├── .gitignore         # Arquivos ignorados pelo Git
├── LICENSE            # Licença do projeto
├── README.md          # Este arquivo
├── app/               # Aplicação principal
│   ├── Dockerfile     # Configuração do container Docker
│   ├── advice.py      # Aplicação Flask principal
│   └── requirements.txt # Dependências Python
└── infra/             # Infraestrutura (vazia por enquanto)
```

## Docker

O Dockerfile está localizado na pasta `app/` e inclui:

- **Alpine Linux** como sistema base (leve e eficiente)
- **Python 3** e dependências de desenvolvimento
- **Ambiente virtual** para isolamento de dependências
- **Instalação automática** das dependências via pip
- **Configuração de porta 80** para acesso direto via HTTP
- **Encoding UTF-8** para suporte completo a caracteres especiais

**Nota:** Certifique-se de executar os comandos Docker dentro do diretório `app/` onde está localizado o Dockerfile.
