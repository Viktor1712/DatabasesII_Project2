FROM postgres:18

RUN apt-get update && apt-get install -y \
    postgresql-18-tds-fdw \
    postgresql-18-mongo-fdw \
    && rm -rf /var/lib/apt/lists/*
