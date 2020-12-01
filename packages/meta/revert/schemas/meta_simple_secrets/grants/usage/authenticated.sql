-- Revert: schemas/meta_simple_secrets/grants/usage/authenticated from pg

BEGIN;


REVOKE USAGE
ON SCHEMA "meta_simple_secrets"
FROM authenticated;

COMMIT;  

