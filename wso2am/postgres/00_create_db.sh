#!/bin/sh

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE wso2am_db;
    CREATE DATABASE wso2carbon_db;
    CREATE DATABASE wso2mb_db;
    CREATE DATABASE wso2_metrics;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "wso2am_db" -f /docker-entrypoint-initdb.d/sql/wso2am.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "wso2mb_db" -f /docker-entrypoint-initdb.d/sql/wso2mb.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "wso2carbon_db" -f /docker-entrypoint-initdb.d/sql/wso2carbon.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "wso2_metrics" -f /docker-entrypoint-initdb.d/sql/metrics.sql