-- Revert: schemas/meta_public/tables/apis/triggers/tg_timestamps from pg

BEGIN;


ALTER TABLE "meta_public".apis DROP COLUMN created_at;
ALTER TABLE "meta_public".apis DROP COLUMN updated_at;

DROP TRIGGER tg_timestamps ON "meta_public".apis;

COMMIT;  

