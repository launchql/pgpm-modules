-- Revert: schemas/meta_public/procedures/reset_password/procedure from pg

BEGIN;


DROP FUNCTION "meta_public".reset_password;

COMMIT;  

