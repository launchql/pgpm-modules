-- Revert: schemas/meta_encrypted_secrets/grants/usage/authenticated from pg

BEGIN;


REVOKE USAGE
ON SCHEMA "meta_encrypted_secrets"
FROM authenticated;

COMMIT;  

