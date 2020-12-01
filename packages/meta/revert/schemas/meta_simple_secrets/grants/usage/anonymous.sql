-- Revert: schemas/meta_simple_secrets/grants/usage/anonymous from pg

BEGIN;


REVOKE USAGE
ON SCHEMA "meta_simple_secrets"
FROM anonymous;

COMMIT;  

