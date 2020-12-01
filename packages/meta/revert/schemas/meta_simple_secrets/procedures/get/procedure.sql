-- Revert: schemas/meta_simple_secrets/procedures/get/procedure from pg

BEGIN;


DROP FUNCTION "meta_simple_secrets".get;
COMMIT;  

