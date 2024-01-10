FROM postgres:15.5-alpine

ENV POSTGRES_PASSWORD postgres

COPY us_retail_sales.csv /docker-entrypoint-initdb.d/
COPY create_retail_sales_table.sql /docker-entrypoint-initdb.d/
