-- Revert: schemas/meta_public/procedures/get_current_group_ids/procedure from pg

BEGIN;


DROP FUNCTION "meta_public".get_current_group_ids;

COMMIT;  

