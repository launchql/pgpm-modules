-- Revert: schemas/meta_private/grants/usage/anonymous from pg

BEGIN;


REVOKE USAGE
ON SCHEMA "meta_private"
FROM anonymous;

COMMIT;  

