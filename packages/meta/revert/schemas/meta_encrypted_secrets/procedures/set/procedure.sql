-- Revert: schemas/meta_encrypted_secrets/procedures/set/procedure from pg

BEGIN;


DROP FUNCTION "meta_encrypted_secrets".set;
COMMIT;  

