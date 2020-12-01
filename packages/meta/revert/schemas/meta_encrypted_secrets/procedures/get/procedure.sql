-- Revert: schemas/meta_encrypted_secrets/procedures/get/procedure from pg

BEGIN;


DROP FUNCTION "meta_encrypted_secrets".get;
COMMIT;  

