-- Revert: schemas/meta_public/grants/usage/authenticated from pg

BEGIN;


REVOKE USAGE
ON SCHEMA "meta_public"
FROM authenticated;

COMMIT;  

