-- Revert: schemas/meta_public/tables/organization_settings/triggers/tg_timestamps from pg

BEGIN;


ALTER TABLE "meta_public".organization_settings DROP COLUMN created_at;
ALTER TABLE "meta_public".organization_settings DROP COLUMN updated_at;

DROP TRIGGER tg_timestamps ON "meta_public".organization_settings;

COMMIT;  

