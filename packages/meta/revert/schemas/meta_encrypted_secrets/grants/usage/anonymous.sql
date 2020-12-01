-- Revert: schemas/meta_encrypted_secrets/grants/usage/anonymous from pg

BEGIN;


REVOKE USAGE
ON SCHEMA "meta_encrypted_secrets"
FROM anonymous;

COMMIT;  

