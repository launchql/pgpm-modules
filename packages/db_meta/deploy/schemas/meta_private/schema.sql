-- Deploy schemas/meta_private/schema to pg


BEGIN;

CREATE SCHEMA meta_private;

GRANT USAGE ON SCHEMA meta_private TO authenticated;
ALTER DEFAULT PRIVILEGES IN SCHEMA meta_private GRANT SELECT ON TABLES TO administrator;

COMMIT;
