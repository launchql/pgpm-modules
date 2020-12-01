-- Revert: schemas/meta_public/procedures/get_current_user_id/procedure from pg

BEGIN;


DROP FUNCTION "meta_public".get_current_user_id;

COMMIT;  

