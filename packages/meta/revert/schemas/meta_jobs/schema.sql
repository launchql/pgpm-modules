-- Revert: schemas/meta_jobs/schema from pg

BEGIN;


DROP SCHEMA IF EXISTS "meta_jobs" CASCADE;
COMMIT;  

