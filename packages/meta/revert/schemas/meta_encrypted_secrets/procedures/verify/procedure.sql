-- Revert: schemas/meta_encrypted_secrets/procedures/verify/procedure from pg

BEGIN;


DROP FUNCTION "meta_encrypted_secrets".verify;
COMMIT;  

