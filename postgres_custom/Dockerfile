FROM postgres:15

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    python3 python3-pip \
    git make gcc g++ \
    postgresql-server-dev-15 freetds-dev libssl-dev pkg-config \
    libmongoc-dev libbson-dev && \
    pip install multicorn mongo_fdw && \
    rm -rf /var/lib/apt/lists/*

# Instalar tds_fdw (para MSSQL)
RUN git clone https://github.com/tds-fdw/tds_fdw.git /tmp/tds_fdw && \
    cd /tmp/tds_fdw && make && make install && \
    rm -rf /tmp/tds_fdw

# Copiar script de inicialización
COPY ./scripts/init_postgres.sql /docker-entrypoint-initdb.d/

EXPOSE 5432
