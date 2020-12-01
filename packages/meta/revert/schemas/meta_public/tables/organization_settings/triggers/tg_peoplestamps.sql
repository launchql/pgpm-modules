-- Revert: schemas/meta_public/tables/organization_settings/triggers/tg_peoplestamps from pg

BEGIN;


ALTER TABLE "meta_public".organization_settings DROP COLUMN created_by;
ALTER TABLE "meta_public".organization_settings DROP COLUMN updated_by;

DROP TRIGGER tg_peoplestamps
ON "meta_public".organization_settings;


COMMIT;  

