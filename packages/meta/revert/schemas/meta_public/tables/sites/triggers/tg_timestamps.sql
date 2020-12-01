-- Revert: schemas/meta_public/tables/sites/triggers/tg_timestamps from pg

BEGIN;


ALTER TABLE "meta_public".sites DROP COLUMN created_at;
ALTER TABLE "meta_public".sites DROP COLUMN updated_at;

DROP TRIGGER tg_timestamps ON "meta_public".sites;

COMMIT;  

