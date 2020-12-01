-- Revert: schemas/meta_public/tables/site_metadata/triggers/tg_timestamps from pg

BEGIN;


ALTER TABLE "meta_public".site_metadata DROP COLUMN created_at;
ALTER TABLE "meta_public".site_metadata DROP COLUMN updated_at;

DROP TRIGGER tg_timestamps ON "meta_public".site_metadata;

COMMIT;  

