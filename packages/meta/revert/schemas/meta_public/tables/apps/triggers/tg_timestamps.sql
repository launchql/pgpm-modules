-- Revert: schemas/meta_public/tables/apps/triggers/tg_timestamps from pg

BEGIN;


ALTER TABLE "meta_public".apps DROP COLUMN created_at;
ALTER TABLE "meta_public".apps DROP COLUMN updated_at;

DROP TRIGGER tg_timestamps ON "meta_public".apps;

COMMIT;  

