-- Revert: schemas/meta_public/grants/usage/anonymous from pg

BEGIN;


REVOKE USAGE
ON SCHEMA "meta_public"
FROM anonymous;

COMMIT;  

