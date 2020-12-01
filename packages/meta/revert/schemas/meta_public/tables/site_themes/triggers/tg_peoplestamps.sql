-- Revert: schemas/meta_public/tables/site_themes/triggers/tg_peoplestamps from pg

BEGIN;


ALTER TABLE "meta_public".site_themes DROP COLUMN created_by;
ALTER TABLE "meta_public".site_themes DROP COLUMN updated_by;

DROP TRIGGER tg_peoplestamps
ON "meta_public".site_themes;


COMMIT;  

