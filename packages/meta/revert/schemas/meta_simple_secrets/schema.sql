-- Revert: schemas/meta_simple_secrets/schema from pg

BEGIN;


DROP SCHEMA IF EXISTS "meta_simple_secrets" CASCADE;
COMMIT;  

