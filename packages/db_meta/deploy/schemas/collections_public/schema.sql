-- Deploy schemas/collections_public/schema to pg

BEGIN;

CREATE SCHEMA collections_public;

GRANT USAGE ON SCHEMA collections_public TO authenticated;

ALTER DEFAULT PRIVILEGES IN SCHEMA
collections_public GRANT ALL ON TABLES TO administrator;

ALTER DEFAULT PRIVILEGES IN SCHEMA
collections_public GRANT ALL ON FUNCTIONS TO administrator;

COMMIT;
