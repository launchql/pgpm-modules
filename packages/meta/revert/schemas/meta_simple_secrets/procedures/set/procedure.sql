-- Revert: schemas/meta_simple_secrets/procedures/set/procedure from pg

BEGIN;


DROP FUNCTION "meta_simple_secrets".set;
COMMIT;  

