-- Deploy schemas/meta_public/schema to pg


BEGIN;

CREATE SCHEMA meta_public;

GRANT USAGE ON SCHEMA meta_public TO authenticated;
ALTER DEFAULT PRIVILEGES IN SCHEMA meta_public GRANT SELECT ON TABLES TO administrator;

COMMIT;
