-- Revert: schemas/meta_private/schema from pg

BEGIN;


DROP SCHEMA IF EXISTS "meta_private" CASCADE;
COMMIT;  

