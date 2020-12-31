-- Deploy schemas/collections_private/schema to pg

BEGIN;

CREATE SCHEMA collections_private;

GRANT USAGE ON SCHEMA collections_private TO authenticated;

ALTER DEFAULT PRIVILEGES IN SCHEMA collections_private
GRANT ALL ON TABLES TO administrator;

ALTER DEFAULT PRIVILEGES IN SCHEMA collections_private
GRANT ALL ON FUNCTIONS TO administrator;

COMMIT;
