-- Revert: schemas/meta_simple_secrets/procedures/del/procedure from pg

BEGIN;


DROP FUNCTION "meta_simple_secrets".del;
COMMIT;  

