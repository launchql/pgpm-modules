-- Revert: schemas/meta_private/procedures/authenticate/procedure from pg

BEGIN;


DROP FUNCTION "meta_private".authenticate;
COMMIT;  

