-- Revert: schemas/meta_public/procedures/forgot_password/procedure from pg

BEGIN;


DROP FUNCTION "meta_public".forgot_password;
COMMIT;  

