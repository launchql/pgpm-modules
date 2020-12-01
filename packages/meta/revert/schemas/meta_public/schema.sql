-- Revert: schemas/meta_public/schema from pg

BEGIN;


DROP SCHEMA IF EXISTS "meta_public" CASCADE;
COMMIT;  

