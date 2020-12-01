-- Revert: schemas/meta_public/procedures/set_password/procedure from pg

BEGIN;


DROP FUNCTION "meta_public".set_password;
COMMIT;  

