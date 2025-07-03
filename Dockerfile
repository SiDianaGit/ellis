# Use uma imagem oficial do Python como imagem base
FROM python:3.13.4-alpine3.22

# Define variáveis de ambiente para otimizar o Python
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# Expõe a porta em que o app será executado
EXPOSE 8000

# Comando para executar a aplicação quando o contêiner iniciar
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
