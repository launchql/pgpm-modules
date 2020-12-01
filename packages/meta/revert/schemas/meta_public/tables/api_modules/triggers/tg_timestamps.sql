-- Revert: schemas/meta_public/tables/api_modules/triggers/tg_timestamps from pg

BEGIN;


ALTER TABLE "meta_public".api_modules DROP COLUMN created_at;
ALTER TABLE "meta_public".api_modules DROP COLUMN updated_at;

DROP TRIGGER tg_timestamps ON "meta_public".api_modules;

COMMIT;  

