-- Revert: schemas/meta_jobs/grants/usage/authenticated from pg

BEGIN;


REVOKE USAGE
ON SCHEMA "meta_jobs"
FROM authenticated;

COMMIT;  

