-- Revert: schemas/meta_public/tables/site_themes/triggers/tg_timestamps from pg

BEGIN;


ALTER TABLE "meta_public".site_themes DROP COLUMN created_at;
ALTER TABLE "meta_public".site_themes DROP COLUMN updated_at;

DROP TRIGGER tg_timestamps ON "meta_public".site_themes;

COMMIT;  

