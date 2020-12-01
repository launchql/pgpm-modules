-- Revert: schemas/meta_encrypted_secrets/schema from pg

BEGIN;


DROP SCHEMA IF EXISTS "meta_encrypted_secrets" CASCADE;
COMMIT;  

