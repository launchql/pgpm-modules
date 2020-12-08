-- Deploy schemas/collections_private/schema to pg

BEGIN;

CREATE SCHEMA collections_private;

GRANT USAGE ON SCHEMA collections_private TO authenticated;

COMMIT;
