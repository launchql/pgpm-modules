-- Deploy schemas/collections_public/schema to pg

BEGIN;

CREATE SCHEMA collections_public;

GRANT USAGE ON SCHEMA collections_public TO authenticated;

COMMIT;
