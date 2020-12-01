-- Revert: schemas/meta_jobs/alterations/alt0000000002 from pg

BEGIN;

DROP SCHEMA "meta_jobs" CASCADE;


COMMIT;  

