-- Revert: schemas/meta_public/procedures/get_current_user/procedure from pg

BEGIN;


DROP FUNCTION "meta_public".get_current_user;
COMMIT;  

