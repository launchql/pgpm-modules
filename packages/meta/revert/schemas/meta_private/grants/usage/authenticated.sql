-- Revert: schemas/meta_private/grants/usage/authenticated from pg

BEGIN;


REVOKE USAGE
ON SCHEMA "meta_private"
FROM authenticated;

COMMIT;  

