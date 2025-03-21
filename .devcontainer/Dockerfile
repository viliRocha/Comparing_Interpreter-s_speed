# Base image
FROM python:3.13.2-slim

# Atualizar os pacotes e instalar dependências necessárias
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Baixar e instalar o get-pip.py para garantir que o pip esteja instalado
WORKDIR /tmp
RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py

# Configurar o PATH para incluir o diretório do pip
ENV PATH="/usr/local/bin:${PATH}"

# Verificar a instalação do pip
RUN pip3 --version

# Copiar o código do projeto para o contêiner
WORKDIR /app
COPY . /app

# Instalar dependências Python
RUN pip3 install --no-cache-dir gspread

# Comando padrão para o contêiner (opcional)
CMD ["python", "exec_time_organizer.py"]
