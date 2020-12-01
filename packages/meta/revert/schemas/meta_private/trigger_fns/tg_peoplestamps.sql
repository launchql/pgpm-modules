-- Revert: schemas/meta_private/trigger_fns/tg_peoplestamps from pg

BEGIN;


DROP FUNCTION "meta_private".tg_peoplestamps();
COMMIT;  

