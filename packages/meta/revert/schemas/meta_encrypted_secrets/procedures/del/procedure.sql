-- Revert: schemas/meta_encrypted_secrets/procedures/del/procedure from pg

BEGIN;


DROP FUNCTION "meta_encrypted_secrets".del;
COMMIT;  

