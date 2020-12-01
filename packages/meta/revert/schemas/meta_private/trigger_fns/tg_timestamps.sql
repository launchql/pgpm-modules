-- Revert: schemas/meta_private/trigger_fns/tg_timestamps from pg

BEGIN;


DROP FUNCTION "meta_private".tg_timestamps();
COMMIT;  

