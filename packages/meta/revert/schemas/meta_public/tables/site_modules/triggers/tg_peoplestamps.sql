-- Revert: schemas/meta_public/tables/site_modules/triggers/tg_peoplestamps from pg

BEGIN;


ALTER TABLE "meta_public".site_modules DROP COLUMN created_by;
ALTER TABLE "meta_public".site_modules DROP COLUMN updated_by;

DROP TRIGGER tg_peoplestamps
ON "meta_public".site_modules;


COMMIT;  

