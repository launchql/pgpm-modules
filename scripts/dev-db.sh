#!/usr/bin/env bash
set -euo pipefail

CONTAINER_NAME="${CONTAINER_NAME:-launchql-pg}"
POSTGRES_PASSWORD="${POSTGRES_PASSWORD:-postgres}"
POSTGRES_USER="${POSTGRES_USER:-postgres}"
POSTGRES_DB="${POSTGRES_DB:-testdb}"
HOST_PORT="${HOST_PORT:-5432}"
IMAGE="${IMAGE:-postgis/postgis:15-3.4}"

if ! docker ps -a --format "{{.Names}}" | grep -q "^${CONTAINER_NAME}\$"; then
  docker run --name "${CONTAINER_NAME}" \
    -e POSTGRES_PASSWORD="${POSTGRES_PASSWORD}" \
    -e POSTGRES_USER="${POSTGRES_USER}" \
    -e POSTGRES_DB="${POSTGRES_DB}" \
    -p ${HOST_PORT}:5432 -d "${IMAGE}"
fi

until docker exec "${CONTAINER_NAME}" pg_isready -U "${POSTGRES_USER}" -h localhost; do
  sleep 2
done

docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -c 'CREATE EXTENSION IF NOT EXISTS postgis;'
docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -c 'CREATE EXTENSION IF NOT EXISTS pgcrypto;'
docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -c 'CREATE EXTENSION IF NOT EXISTS citext;'
docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -c 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp";'
docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -c 'CREATE EXTENSION IF NOT EXISTS hstore;'
if ! docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d postgres -tAc "SELECT 1 FROM pg_database WHERE datname = 'testing-template-db'" | grep -q 1; then
  docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" createdb -U "${POSTGRES_USER}" -h localhost -e testing-template-db -T template0
fi
docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d testing-template-db -c 'CREATE EXTENSION IF NOT EXISTS postgis;'
docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d testing-template-db -c 'CREATE EXTENSION IF NOT EXISTS pgcrypto;'
docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d testing-template-db -c 'CREATE EXTENSION IF NOT EXISTS citext;'
docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d testing-template-db -c 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp";'
docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d testing-template-db -c 'CREATE EXTENSION IF NOT EXISTS hstore;'


docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -c 'CREATE SCHEMA IF NOT EXISTS myschema;'
docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -c 'CREATE SCHEMA IF NOT EXISTS myschema_public;'
docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -c 'CREATE SCHEMA IF NOT EXISTS meta_public;'
docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -c 'CREATE SCHEMA IF NOT EXISTS meta_private;'
docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -c 'CREATE SCHEMA IF NOT EXISTS collections_public;'
docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -c 'CREATE SCHEMA IF NOT EXISTS collections_private;'
docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -c 'CREATE SCHEMA IF NOT EXISTS app_jobs;'

docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -v ON_ERROR_STOP=1 -c "DO \$\$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'anonymous') THEN CREATE ROLE anonymous; END IF; END \$\$;"
docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -c "ALTER ROLE anonymous WITH NOCREATEDB NOSUPERUSER NOCREATEROLE NOLOGIN NOREPLICATION NOBYPASSRLS;"

docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -v ON_ERROR_STOP=1 -c "DO \$\$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'authenticated') THEN CREATE ROLE authenticated; END IF; END \$\$;"
docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -c "ALTER ROLE authenticated WITH NOCREATEDB NOSUPERUSER NOCREATEROLE NOLOGIN NOREPLICATION NOBYPASSRLS;"

docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -v ON_ERROR_STOP=1 -c "DO \$\$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'administrator') THEN CREATE ROLE administrator; END IF; END \$\$;"
docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -c "ALTER ROLE administrator WITH NOCREATEDB NOSUPERUSER NOCREATEROLE NOLOGIN NOREPLICATION BYPASSRLS;"

echo "Database ready at postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@localhost:${HOST_PORT}/${POSTGRES_DB}"
