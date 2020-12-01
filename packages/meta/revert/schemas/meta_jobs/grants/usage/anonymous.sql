-- Revert: schemas/meta_jobs/grants/usage/anonymous from pg

BEGIN;


REVOKE USAGE
ON SCHEMA "meta_jobs"
FROM anonymous;

COMMIT;  

