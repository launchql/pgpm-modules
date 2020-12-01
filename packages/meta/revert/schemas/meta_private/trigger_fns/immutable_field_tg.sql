-- Revert: schemas/meta_private/trigger_fns/immutable_field_tg from pg

BEGIN;


DROP FUNCTION "meta_private".immutable_field_tg;
COMMIT;  

